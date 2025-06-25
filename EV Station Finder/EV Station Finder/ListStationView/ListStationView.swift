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
        Group {
            if viewModel.isLoading {
                ProgressView()
                
            } else if let errorMsg = viewModel.errorMessage {
                VStack {
                    Spacer()
                    Text(errorMsg)
                        .font(.title3)
                        .foregroundColor(.red)
                        .multilineTextAlignment(.center)
                        .padding()
                    Spacer()
                }
                
            } else if viewModel.stationViews.isEmpty {
                Text("There are no available EV Station for the selected ZIP Code")
                    .font(.title3)
                    .multilineTextAlignment(.center)
                    .padding()
                
            } else {
                List(viewModel.stationViews) { station in
                    NavigationLink(destination: Text("")) {
                        VStack(alignment: .leading) {
                            ForEach(station.displayLines, id: \.self) { line in
                                Text(line).font(.headline)
                            }
                        }
                    }
                }
                .navigationTitle("Available EV Stations")
            }
        }
        .alert(item: $viewModel.errorMessage) { msg in
            Alert(
                title: Text("Error"),
                message: Text(msg),
                dismissButton: .default(Text("OK")) {
                    viewModel.errorMessage = nil
                }
            )
        }
    }
}


#Preview {
    ListStationView(viewModel: ListStationViewModel(zipCode: "94100"))
}
