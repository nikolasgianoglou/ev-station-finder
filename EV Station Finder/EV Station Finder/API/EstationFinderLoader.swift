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
    
    public enum Error: Swift.Error {
        case noConnectivity
        case invalidData
    }
    
    public typealias Result = StationFinderResult
    
    public init(url: URL, client: HTTPClient) {
        self.url = url
        self.client = client
    }
    
    func load(completion: @escaping (Result) -> Void) {
        client.get(from: url) { [weak self] result in
            guard self != nil else { return }
            switch result {
            case let .success(data, response):
                break
//                completion(FeedItemsMapper.map(data, from: response))
            case .failure:
                completion(.failure(Error.noConnectivity))
            }
        }
    }
    
}
