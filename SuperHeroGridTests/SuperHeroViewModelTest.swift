//
//  SuperHeroViewModelTest.swift
//  SuperHeroGridTests
//
//  Created by Derlis Ramón Cañete Ríos on 2023-02-03.
//

import XCTest
@testable import SuperHeroGrid

final class SuperHeroViewModelTest: XCTestCase {

    func testSuperHeroes() {
        let testViewModel = SuperHeroViewModel(superHeroDataService: MockSuperHeroDataService())
        
        testViewModel.fetchSuperHeros()
        
        XCTAssert(testViewModel.superHeros.count <= 563)
    }
}
