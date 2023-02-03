//
//  SuperHeroeDataService.swift
//  SuperHeroGrid
//
//  Created by Derlis Ramón Cañete Ríos on 2023-02-02.
//

import Foundation

protocol SuperHeroDataServiceProtocol {
    
    func getSuperHeros(completion: @escaping(Result<[SuperHeroModel], NetworkError>) -> Void)
}


class SuperHeroDataService: SuperHeroDataServiceProtocol {
    
    func getSuperHeros(completion: @escaping (Result<[SuperHeroModel], NetworkError>) -> Void) {
        APIClient.getSuperHeros(completion: completion)
    }
}
