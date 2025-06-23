//
//  StationFinder.swift
//  EV Station Finder
//
//  Created by Nikolas Gianoglou on 22/06/25.
//

import Foundation

enum StationFinderResult {
    case success(EVStationsResponse)
    case failure(Error)
}

protocol StationFinder {
    func load(completion: @escaping (StationFinderResult) -> Void)
}
