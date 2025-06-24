//
//  ListStationView.swift
//  EV Station Finder
//
//  Created by Nikolas Gianoglou on 23/06/25.
//

import SwiftUI

struct ListStationView: View {
    
    @ObservedObject var viewModel = ListStationViewModel()
    
    var body: some View {
            if viewModel.isLoading {
                ProgressView()
            } else {
                if viewModel.stations.isEmpty {
                    Text("There are no available EV Station for the selected ZIP Code")
                        .font(.title3)
                } else {
                    List {
                        ForEach(viewModel.stations) { station in
                            NavigationLink(
                                destination: Text("")
                            ) {
                                VStack(alignment: .leading) {
                                    Text("\("Station name:") \(station.stationName ?? "")")
                                    Text("\("Street Adress:") \(station.streetAddress ?? "")")
                                    Text("\("State:") \(station.state ?? "")")
                                    Text("\("Zip Code:") \(station.zip ?? "")")
                                }
                                .font(.headline)
                            }
                        }
                    }
                    .navigationTitle("Available EV Stations")
                }
            }
    }
}

#Preview {
    ListStationView()
}
