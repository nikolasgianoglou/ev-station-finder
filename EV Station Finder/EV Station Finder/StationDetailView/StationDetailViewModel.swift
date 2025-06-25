//
//  StationDetailViewModel.swift
//  EV Station Finder
//
//  Created by Nikolas Gianoglou on 25/06/25.
//

import Foundation

class StationDetailViewModel: ObservableObject {
    let detailData: StationDetailData

    init(station: EVStation) {
        self.detailData = StationDetailData(from: station)
    }
}
