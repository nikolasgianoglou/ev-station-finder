//
//  StationDetailData.swift
//  EV Station Finder
//
//  Created by Nikolas Gianoglou on 25/06/25.
//

import Foundation

struct StationDetailData: Identifiable {
    let id: Int
    let name: String
    let fullAddress: String

    init(from station: EVStation) {
        self.id = station.id ?? 0
        self.name = station.stationName ?? "Unnamed Station"

        self.fullAddress = [
            station.streetAddress,
            station.city,
            station.state,
            station.zip
        ]
        .compactMap { $0 }
        .joined(separator: ", ")
    }
}
