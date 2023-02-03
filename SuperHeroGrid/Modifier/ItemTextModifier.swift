//
//  ItemTextModifier.swift
//  SuperHeroGrid
//
//  Created by Derlis Ramón Cañete Ríos on 2023-02-03.
//

import SwiftUI

struct ItemTextModifier: ViewModifier {
    func body(content: Content) -> some View {
        if #available(iOS 16.0, *) {
            content
                .font(.caption2)
                .fontWeight(.semibold)
                .foregroundColor(.white)
        } else {
            content
                .font(.caption2.weight(.semibold))
                .foregroundColor(.white)
        }
    }
}
