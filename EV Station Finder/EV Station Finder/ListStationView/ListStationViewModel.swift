//
//  ListStationViewModel.swift
//  EV Station Finder
//
//  Created by Nikolas Gianoglou on 23/06/25.
//

import Foundation

class ListStationViewModel: ObservableObject {
    @Published var isLoading = false
    @Published var stations: [EVStation] = []
    
    var loader = EstationFinderLoader(url: URL(string: "https://developer.nrel.gov/api/alt-fuel-stations/v1.json?fuel_type=ELEC&zip=90024&api_key=bBq4N7KlpYzQuvM0FBMIrKVe5sc5sPqWFEJOxEKw")!,
                                      client: URLSessionHTTPClient())
    
    init() {
        getStations(zipCode: "")
    }
    
    func getStations(zipCode: String) {
        isLoading = true
        loader.load { [weak self] result in
            DispatchQueue.main.async {
                guard let self else { return }
                self.isLoading = false
                switch result {
                case .success(let stations):
                    self.stations = stations.fuelStations ?? []
                case .failure:
                    self.stations = []
                }
            }
        }
    }
}
