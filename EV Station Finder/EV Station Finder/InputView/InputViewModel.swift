//
//  InputViewModel.swift
//  EV Station Finder
//
//  Created by Nikolas Gianoglou on 23/06/25.
//

import Foundation

class InputViewModel: ObservableObject {
    @Published var isValidZip = false
    @Published var showError = false

    func validateZipCode(_ zip: String) {
        if zip.count == 5 && zip.allSatisfy(\.isNumber) {
            isValidZip = true
            showError = false
        } else {
            isValidZip = false
            showError = true
        }
    }
    
}
