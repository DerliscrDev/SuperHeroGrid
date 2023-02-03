//
//  ArrayExtension.swift
//  SuperHeroGrid
//
//  Created by Derlis Ramón Cañete Ríos on 2023-02-03.
//

import Foundation

extension Array {
    func sorted<T: Comparable>(by compare: (Element) -> T, asc ascendant: Bool = false) -> Array {
        
        return self.sorted {
            if ascendant {
                return compare($0) < compare($1)
            }

            return compare($0) > compare($1)
        }
    }
}
