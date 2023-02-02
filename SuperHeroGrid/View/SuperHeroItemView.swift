//
//  SuperHeroItemView.swift
//  SuperHeroGrid
//
//  Created by Derlis Ramón Cañete Ríos on 2023-02-02.
//

import SwiftUI

struct SuperHeroItemView: View {
    
    var superHero: SuperHeroModel
    
    var body: some View {
        ZStack {
//            Image(uiImage: superHero.image)
//                .resizable()
//                .scaledToFill()
//                .cornerRadius(12)
            
            HStack {
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
//                .offset(y: 80)
                .padding(.horizontal, 10)
                Spacer()
            }
        }
    }
}

struct SuperHeroItemView_Previews: PreviewProvider {
    static var previews: some View {
        SuperHeroItemView(superHero: dev.superHero)
            .padding()
    }
}
