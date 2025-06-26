//
//  EVStationViewData.swift
//  EV Station Finder
//
//  Created by Nikolas Gianoglou on 26/06/25.
//

import Foundation

struct EVStationViewData: Identifiable {
    let id: Int
    let displayLines: [String]
    let station: EVStation
    
    init(from station: EVStation) {
        self.id = station.id ?? UUID().hashValue
        var lines: [String] = []
        if let name = station.stationName {
            lines.append("Station name: \(name)")
        }
        if let address = station.streetAddress {
            lines.append("Street Address: \(address)")
        }
        if let state = station.state {
            lines.append("State: \(state)")
        }
        if let zip = station.zip {
            lines.append("Zip Code: \(zip)")
        }
        self.station = station
        self.displayLines = lines
    }
}
