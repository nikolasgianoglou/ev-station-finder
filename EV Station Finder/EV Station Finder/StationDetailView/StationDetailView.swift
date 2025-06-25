//
//  StationDetailView.swift
//  EV Station Finder
//
//  Created by Nikolas Gianoglou on 25/06/25.
//

import SwiftUI

struct StationDetailView: View {
    @ObservedObject var viewModel: StationDetailViewModel

    var body: some View {
            ScrollView {
                VStack(alignment: .leading, spacing: 24) {

                    headerSection

                    Divider()

                    locationSection

                    Spacer()
                }
                .padding()
            }
            .navigationTitle("Station Details")
            .navigationBarTitleDisplayMode(.inline)
        }
}

extension StationDetailView {
     var headerSection: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(viewModel.detailData.name)
                .font(.title)
                .fontWeight(.bold)

            Text("EV Charging Station")
                .font(.subheadline)
                .foregroundColor(.gray)
        }
    }

    var locationSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack(alignment: .top) {
                Image(systemName: "mappin.and.ellipse")
                    .foregroundColor(.blue)
                    .frame(width: 20)
                Text(viewModel.detailData.fullAddress)
            }
        }
        .font(.body)
    }
}
