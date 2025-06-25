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
                loadingView
            } else if let errorMsg = viewModel.errorMessage {
                errorView(message: errorMsg)
            } else if viewModel.stationViews.isEmpty {
                emptyListView
            } else {
                stationsListView
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
        .navigationTitle("Available EV Stations")
    }
}

extension ListStationView {
    
    var loadingView: some View {
        ProgressView()
    }
    
    func errorView(message: String) -> some View {
        VStack {
            Spacer()
            Text(message)
                .font(.title3)
                .foregroundColor(.red)
                .multilineTextAlignment(.center)
                .padding()
            Spacer()
        }
    }
    
    var emptyListView: some View {
        Text("There are no available EV Station for the selected ZIP Code")
            .font(.title3)
            .multilineTextAlignment(.center)
            .padding()
    }
    
    var stationsListView: some View {
        List(viewModel.stationViews) { station in
            NavigationLink(destination: Text("")) {
                VStack(alignment: .leading) {
                    ForEach(station.displayLines, id: \.self) { line in
                        Text(line)
                            .font(.headline)
                    }
                }
            }
        }
    }
}



#Preview {
    ListStationView(viewModel: ListStationViewModel(zipCode: "94100"))
}
