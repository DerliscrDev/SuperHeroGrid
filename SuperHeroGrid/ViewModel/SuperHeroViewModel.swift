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
    private var superHerosCopy: [SuperHeroModel] = []
    
    init(superHeroDataService: SuperHeroDataService = SuperHeroDataService()) {
        self.superHeroDataService = superHeroDataService
    }
    
    func fetchSuperHeros() {
        superHeroDataService.getSuperHeros { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let superHeros):
                    self?.superHeros = superHeros
                    self?.superHerosCopy = superHeros
                case .failure(let error):
                    print(error)
                }
            }
        }
    }
    
    func deleteSuperHero(superHero: SuperHeroModel) {
        if let indexToDelete = superHeros.firstIndex(where: { $0.id == superHero.id }) {
            superHeros.remove(at: indexToDelete)
            superHerosCopy = superHeros
        }
    }
    
    func sortByName() {
        let arraySorted = self.superHerosCopy.sorted(by: { $0.name ?? "" }, asc: true)
        superHeros = arraySorted
        
    }
    
    func sortByIntelligence() {
        let arraySorted = superHerosCopy.sorted(by: { $0.powerstats?.intelligence ?? 0 })
        superHeros = arraySorted
    }
    
    func sortByStrength() {
        let arraySorted = superHerosCopy.sorted(by: { $0.powerstats?.strength ?? 0 })
        superHeros = arraySorted
    }
    
    func sortBySpeed() {
        let arraySorted = superHerosCopy.sorted(by: { $0.powerstats?.speed ?? 0 })
        superHeros = arraySorted
    }
    
    func sortByDurability() {
        let arraySorted = superHerosCopy.sorted(by: { $0.powerstats?.durability ?? 0 })
        superHeros = arraySorted
    }
    
    func sortByPower() {
        let arraySorted = superHerosCopy.sorted(by: { $0.powerstats?.power ?? 0 })
        superHeros = arraySorted
    }
    
    func sortByCombat() {
        let arraySorted = superHerosCopy.sorted(by: { $0.powerstats?.combat ?? 0 })
        superHeros = arraySorted
    }
}
