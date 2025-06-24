//
//  EVStations.swift
//  EV Station Finder
//
//  Created by Nikolas Gianoglou on 22/06/25.
//

import Foundation

struct EVStationsResponse: Decodable {
    let fuelStations: [EVStation]?

    enum CodingKeys: String, CodingKey {
        case fuelStations = "fuel_stations"
    }
}

struct EVStation: Decodable, Identifiable {
    let id: Int?
    let stationName: String?
    let streetAddress: String?
    let city: String?
    let state: String?
    let zip: String?

    enum CodingKeys: String, CodingKey {
        case id
        case stationName = "station_name"
        case streetAddress = "street_address"
        case city
        case state
        case zip
    }
}
