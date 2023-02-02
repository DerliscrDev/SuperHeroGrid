//
//  SuperHeroDetailView.swift
//  SuperHeroGrid
//
//  Created by Derlis Ramón Cañete Ríos on 2023-02-02.
//

import SwiftUI

struct SuperHeroDetailView: View {
    
    var superHero: SuperHeroModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(superHero.name ?? "")
                .font(.system(size: 15))
                .fontWeight(.heavy)
                .foregroundColor(.black)
                .multilineTextAlignment(.leading)
            VStack(alignment: .leading, spacing: 4) {
                Text("Height: \(superHero.appearance?.height?.last ?? "")")
                    .font(.caption2)
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
                
                Text("Weight: \(superHero.appearance?.weight?.last ?? "")")
                    .font(.caption2)
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
            }
        }
    }
}

struct SuperHeroDetailView_Previews: PreviewProvider {
    static var previews: some View {
        SuperHeroDetailView(superHero: dev.superHero)
    }
}
