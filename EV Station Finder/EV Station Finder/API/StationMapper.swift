//
//  StationMapper.swift
//  EV Station Finder
//
//  Created by Nikolas Gianoglou on 23/06/25.
//

import Foundation

import Foundation

internal final class StationMapper {
    private static var OK_200: Int { return 200 }
    
    internal static func map(_ data: Data, from response: HTTPURLResponse) -> EstationFinderLoader.Result {
        
        guard response.statusCode == OK_200,
              let root = try? JSONDecoder().decode(EVStationsResponse.self, from: data) else {
            return .failure(EstationFinderLoader.Error.invalidData)
        }
        
        return .success(root)
    }
}
