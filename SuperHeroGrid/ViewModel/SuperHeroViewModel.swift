//
//  SuperHeroViewModel.swift
//  SuperHeroGrid
//
//  Created by Derlis Ramón Cañete Ríos on 2023-02-02.
//

import Foundation

class SuperHeroViewModel: ObservableObject {
    
    @Published var superHeros: [SuperHeroModel] = []
    
    func fetchSuperHeros() {
        SuperHeroDataService().getSuperHeros { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let superHeros):
                    self.superHeros = superHeros ?? []
                case .failure(let error):
                    print(error)
                }
            }
        }
    }
}
