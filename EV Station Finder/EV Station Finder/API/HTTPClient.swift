//
//  HTTPClient.swift
//  EV Station Finder
//
//  Created by Nikolas Gianoglou on 22/06/25.
//

import Foundation

public protocol HTTPClient {
    func get(from url: URL, completion: @escaping (HTTPClientResult) -> Void)
}

public enum HTTPClientResult {
    case success(Data, HTTPURLResponse)
    case failure(Error)
}
