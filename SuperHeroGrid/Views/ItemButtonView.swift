//
//  ItemButtonView.swift
//  SuperHeroGrid
//
//  Created by Derlis Ramón Cañete Ríos on 2023-02-03.
//

import SwiftUI

struct ItemButtonView: View {
    // MARK: - Properties
    var icon: String
    var color: Color
    
    // MARK: - Body
    var body: some View {
        Image(systemName: icon)
            .resizable()
            .scaledToFit()
            .foregroundColor(color)
            .frame(width: 30, height: 30)
    }
}

// MARK: - Preview
struct ItemButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ItemButtonView(icon: Icons.minusFill.filledIcon, color: .black)
            .previewLayout(.sizeThatFits)
    }
}
