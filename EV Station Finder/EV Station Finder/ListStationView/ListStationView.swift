//
//  ListStationView.swift
//  EV Station Finder
//
//  Created by Nikolas Gianoglou on 23/06/25.
//

import SwiftUI

struct ListStationView: View {
    
    @ObservedObject var viewModel: ListStationViewModel
    
    var body: some View {
            if viewModel.isLoading {
                ProgressView()
            } else {
                if viewModel.stationViews.isEmpty {
                    Text("There are no available EV Station for the selected ZIP Code")
                        .font(.title3)
                } else {
                    List {
                        ForEach(viewModel.stationViews) { station in
                            NavigationLink(
                                destination: Text("")
                            ) {
                                VStack(alignment: .leading) {
                                    ForEach(station.displayLines, id: \.self) { line in
                                        Text(line)
                                            .font(.headline)
                                    }
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
    ListStationView(viewModel: ListStationViewModel(zipCode: "94100"))
}
