//
//  SuperHeroModel.swift
//  SuperHeroGrid
//
//  Created by Derlis Ramón Cañete Ríos on 2023-02-02.
//

import Foundation

struct SuperHeroModel: Identifiable, Codable {
    let id: Int?
    let name, slug: String?
    let powerstats: Powerstats?
    let appearance: Appearance?
    let biography: Biography?
    let work: Work?
    let connections: Connections?
    let images: Images?
    
    var height: String {
        return "(Height: \(appearance?.height?.last ?? "")"
    }
    
    var weight: String {
        return "(Weight: \(appearance?.weight?.last ?? "")"
    }
}

struct Appearance: Codable {
    let gender, race: String?
    let height, weight: [String]?
    let eyeColor, hairColor: String?
}

struct Biography: Codable {
    let fullName, alterEgos: String?
    let aliases: [String]?
    let placeOfBirth, firstAppearance, publisher, alignment: String?
}

struct Connections: Codable {
    let groupAffiliation, relatives: String?
}

struct Images: Codable {
    let xs, sm, md, lg: String?
}

struct Powerstats: Codable {
    let intelligence, strength, speed, durability: Int?
    let power, combat: Int?
}

struct Work: Codable {
    let occupation, base: String?
}
