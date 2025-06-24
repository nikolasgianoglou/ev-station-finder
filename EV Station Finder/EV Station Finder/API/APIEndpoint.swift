//
//  APIEndpoint.swift
//  EV Station Finder
//
//  Created by Nikolas Gianoglou on 24/06/25.
//

import Foundation

enum APIEndpoint {
    static let baseURL = "https://developer.nrel.gov"

    static func stationsURL(zip: String, apiKey: String) -> URL? {
        var components = URLComponents(string: baseURL)
        components?.path = "/api/alt-fuel-stations/v1.json"
        components?.queryItems = [
            URLQueryItem(name: "fuel_type", value: "ELEC"),
            URLQueryItem(name: "zip", value: zip),
            URLQueryItem(name: "api_key", value: apiKey)
        ]
        return components?.url
    }
}
