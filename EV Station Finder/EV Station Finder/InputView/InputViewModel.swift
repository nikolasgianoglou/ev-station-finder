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
    @Published var lastZip: String?

    private let zipKey = "last_zip_code"

    init() {
        loadLastZip()
    }

    func validateZipCode(_ zip: String) {
        if zip.count == 5 && zip.allSatisfy(\.isNumber) {
            isValidZip = true
            showError = false
            saveZip(zip)
        } else {
            isValidZip = false
            showError = true
        }
    }

    private func saveZip(_ zip: String) {
        UserDefaults.standard.set(zip, forKey: zipKey)
        lastZip = zip
    }

    private func loadLastZip() {
        lastZip = UserDefaults.standard.string(forKey: zipKey)
    }
}

