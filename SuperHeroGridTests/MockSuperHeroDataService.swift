//
//  MockSuperHeroDataService.swift
//  SuperHeroGridTests
//
//  Created by Derlis Ramón Cañete Ríos on 2023-02-03.
//

import Foundation
@testable import SuperHeroGrid

class MockSuperHeroDataService: SuperHeroDataServiceProtocol {
    
    func getSuperHeros(completion: @escaping (Result<[SuperHeroModel], NetworkError>) -> Void) {
        
        guard let jsonData = readLocalJsonFile() else {
            completion(.failure(.downloadDecodingFailedToComplete))
            return
        }
        
        do {
            let obj = try JSONDecoder().decode([SuperHeroModel].self, from: jsonData)
            completion(.success(obj))
        } catch let error {
            print(error.localizedDescription)
            completion(.failure(.cannotDecodeContentData))
        }
    }
    
    private func readLocalJsonFile() -> Data? {
        do {
            guard let fileURL = Bundle.main.url(forResource: "SuperHeroes", withExtension: "json")
            else { return nil }
            
            let data = try Data(contentsOf: fileURL)
            return data
        } catch let error {
            print(error.localizedDescription)
            return nil
        }
    }
}
