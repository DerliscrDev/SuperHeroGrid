//
//  SuperHeroViewModel.swift
//  SuperHeroGrid
//
//  Created by Derlis Ramón Cañete Ríos on 2023-02-02.
//

import Foundation
import SwiftUI

class SuperHeroViewModel: ObservableObject {
    
    @Published var superHeros: [SuperHeroModel] = []
    
    private let superHeroDataService: SuperHeroDataService
    
    init(superHeroDataService: SuperHeroDataService = SuperHeroDataService()) {
        self.superHeroDataService = superHeroDataService
    }
    
    func fetchSuperHeros() {
        superHeroDataService.getSuperHeros { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let superHeros):
                    self.superHeros = superHeros
                case .failure(let error):
                    print(error)
                }
            }
        }
    }
}
