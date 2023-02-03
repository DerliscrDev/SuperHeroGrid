//
//  NetworkingManager.swift
//  SuperHeroGrid
//
//  Created by Derlis Ramón Cañete Ríos on 2023-02-02.
//

import Foundation
import Alamofire

public enum APIRouter: URLRequestConvertible {
    
    case getSuperHeros
    
    private var urlPath: String {
        switch self {
        case .getSuperHeros:
            return Constants.apiURL
        }
    }
    
    private var method: HTTPMethod {
        switch self {
        case .getSuperHeros:
            return .get
        }
    }
    
    public func asURLRequest() throws -> URLRequest {
        let url = try Constants.apiURL.asURL()
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.rawValue
        return urlRequest
    }
}
