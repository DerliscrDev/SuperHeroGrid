//
//  APIClient.swift
//  SuperHeroGrid
//
//  Created by Derlis Ramón Cañete Ríos on 2023-02-02.
//

import Foundation
import Alamofire

enum NetworkError: LocalizedError {
    
    case badURLResponse
    case cannotDecodeContentData
    case downloadDecodingFailedToComplete
    case unknown
}

class APIClient {
    
    static func request<T: Codable>(type:T.Type,
                                    route: APIRouter,
                                    completion: @escaping(Result<T, NetworkError>) -> Void) {
        AF.request(route).response { response in
            let result = response.result
            
            switch result {
            case .success(let data):
                guard let data = data else {
                    completion(.failure(.cannotDecodeContentData))
                    return
                }
                
                guard let object = try? JSONDecoder().decode(T.self, from: data) else {
                    completion(.failure(.downloadDecodingFailedToComplete))
                    return
                }
                completion(.success(object))
                
            case .failure(let error):
                completion(.failure(.badURLResponse))
                print(error.localizedDescription)
            }
        }
    }
    
    static func getSuperHeros(completion: @escaping(Result<[SuperHeroModel], NetworkError>) -> Void) {
        
        return request(type: [SuperHeroModel].self, route: APIRouter.getSuperHeros, completion: completion)
    }
    
}
