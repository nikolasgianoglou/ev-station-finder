//
//  EstationFinderLoader.swift
//  EV Station Finder
//
//  Created by Nikolas Gianoglou on 22/06/25.
//

import Foundation



final class EstationFinderLoader: StationFinder {

    private let url: URL
    private let client: HTTPClient
    
    public typealias Result = StationFinderResult
    
    public enum Error: Swift.Error, LocalizedError {
        case noConnectivity
        case invalidData
        case invalidZip

        public var errorDescription: String? {
            switch self {
            case .noConnectivity:
                return "No internet connection. Please check your network and try again."
            case .invalidData:
                return "Could not load data from the server. Please try again later."
            case .invalidZip:
                return "The ZIP code provided did not return any station data."
            }
        }
    }
    
    public init(url: URL, client: HTTPClient) {
        self.url = url
        self.client = client
    }
    
    func load(completion: @escaping (Result) -> Void) {
        client.get(from: url) { [weak self] result in
            guard self != nil else { return }
            switch result {
            case let .success(data, response):
                completion(StationMapper.map(data, from: response))
            case .failure(let error):
                let mappedError: Error
                if (error as NSError).domain == NSURLErrorDomain {
                    mappedError = .noConnectivity
                } else {
                    mappedError = .invalidData
                }
                completion(.failure(mappedError))
            }
        }
    }
    
}
