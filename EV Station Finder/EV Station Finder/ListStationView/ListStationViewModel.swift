//
//  ListStationViewModel.swift
//  EV Station Finder
//
//  Created by Nikolas Gianoglou on 23/06/25.
//

import Foundation

class ListStationViewModel: ObservableObject {
    @Published var isLoading = false
    @Published var stationViews: [EVStationViewData] = []
    private let zipCode: String
    @Published var errorMessage: String? = nil
    
    var loader: EstationFinderLoader?
    
    init(zipCode: String) {
        self.zipCode = zipCode
        configureLoader()
        getStations()
    }

    private func configureLoader() {
        guard let url = APIEndpoint.stationsURL(zip: zipCode, apiKey: Secrets.apiKey) else {
            print("Invalid URL")
            return
        }
        loader = EstationFinderLoader(url: url, client: URLSessionHTTPClient())
    }
    
    func getStations() {
        isLoading = true
        loader?.load { [weak self] result in
            DispatchQueue.main.async {
                guard let self = self else { return }
                self.isLoading = false
                
                switch result {
                case .success(let stations):
                    let items = (stations.fuelStations ?? []).map(EVStationViewData.init)
                    self.stationViews = items
                    self.errorMessage = nil
                    
                case .failure(let error):
                    self.stationViews = []
                    self.errorMessage = error.localizedDescription
                }
            }
        }
    }
}

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
