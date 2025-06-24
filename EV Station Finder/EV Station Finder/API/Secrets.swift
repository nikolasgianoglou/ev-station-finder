//
//  Secrets.swift
//  EV Station Finder
//
//  Created by Nikolas Gianoglou on 24/06/25.
//

import Foundation

enum Secrets {
    static var apiKey: String {
        guard
            let path = Bundle.main.path(forResource: "Secrets", ofType: "plist"),
            let dict = NSDictionary(contentsOfFile: path),
            let key = dict["API_KEY"] as? String
        else {
            fatalError("API_KEY not found in Secrets.plist")
        }
        return key
    }
}
