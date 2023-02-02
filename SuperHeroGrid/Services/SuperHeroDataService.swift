//
//  SuperHeroeDataService.swift
//  SuperHeroGrid
//
//  Created by Derlis Ramón Cañete Ríos on 2023-02-02.
//

import Foundation

enum ServiceError: LocalizedError {
    case badURLResponse
    case noData
    case unknown
    case decodingError
    
    var errorDescription: String? {
        switch self {
        case .badURLResponse:
            return "Bad response from URL"
        case .unknown:
            return "Unknown error occurred"
        case .noData:
            return "No data"
        case .decodingError:
            return "Error with decoding"
        }
    }
}

class SuperHeroDataService {
    
    func getSuperHeros(completion: @escaping(Result<[SuperHeroModel]?, Error>) -> Void) {
        guard let url = URL(string: "https://bitbucket.org/consultr/superhero-json-api/raw/4b787c39fcbfd8d069339de94bf8f3a6bda69f3e/superheros.json")
        else {
            return completion(.failure(ServiceError.badURLResponse))
            
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                return completion(.failure(ServiceError.noData))
            }
            
            let superHeroResponse = try? JSONDecoder().decode([SuperHeroModel].self, from: data)
            
            if let superHeroResponse = superHeroResponse {
                completion(.success(superHeroResponse))
            } else {
                completion(.failure(ServiceError.decodingError))
            }
        }.resume()
    }
}
