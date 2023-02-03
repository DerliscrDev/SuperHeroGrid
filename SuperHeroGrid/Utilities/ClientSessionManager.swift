//
//  ClientSessionManager.swift
//  SuperHeroGrid
//
//  Created by Derlis Ramón Cañete Ríos on 2023-02-02.
//

import Foundation

class ClientSessionManager {
    static let shared = ClientSessionManager()
    var superHeroes: [SuperHeroModel]?
}
