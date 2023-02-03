//
//  Constants.swift
//  SuperHeroGrid
//
//  Created by Derlis Ramón Cañete Ríos on 2023-02-02.
//

import Foundation

struct Constants {
    static let apiURL = "https://bitbucket.org/consultr/superhero-json-api/raw/4b787c39fcbfd8d069339de94bf8f3a6bda69f3e/superheros.json"
}

enum Icons {
    case eyeSlashFill
    case minusFill
    case eyeFill
    
    var filledIcon: String {
        switch self {
        case .eyeSlashFill:
            return "eye.slash.circle.fill"
        case .minusFill:
            return "minus.circle.fill"
        case .eyeFill:
            return "eye.fill"
        }
    }
}
