//
//  SuperHeroItemView.swift
//  SuperHeroGrid
//
//  Created by Derlis Ramón Cañete Ríos on 2023-02-02.
//

import SwiftUI

struct SuperHeroItemView: View {
    
    var superHero: SuperHeroModel
    var superHeroViewModel: SuperHeroViewModel
    
    var body: some View {
        ZStack {
            AsyncImage(url: URL(string: superHero.images?.sm ?? ""))
                .scaledToFit()
                .cornerRadius(12)
            
            VStack {
                HStack(alignment: .center) {
                    Spacer()
                    
                    Button {
                        
                    } label: {
                        Image(systemName: "eye.slash.circle.fill")
                            .resizable()
                            .scaledToFit()
                            .foregroundColor(Color.blue)
                            .frame(width: 30, height: 30)
                    }
                    .background(
                        Circle()
                            .foregroundColor(.white)
                    )
                    .padding(.horizontal, 10)
                    
                    Button {
                        
                    } label: {
                        Image(systemName: "minus.circle.fill")
                            .resizable()
                            .scaledToFit()
                            .foregroundColor(Color.red)
                            .frame(width: 30, height: 30)
                    }
                    .background(
                        Circle()
                            .foregroundColor(.white)
                    )
                }
                .offset(y: -10)
                
                Spacer()
                
                VStack(alignment: .leading, spacing: 8) {
                    Text(superHero.name ?? "")
                        .font(.system(size: 15))
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.leading)
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Height: \(superHero.appearance?.height?.last ?? "")")
                            .font(.caption2)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                        
                        Text("Weight: \(superHero.appearance?.weight?.last ?? "")")
                            .font(.caption2)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                    }
                }
            }
        }
        .frame(width: 160, height: 240)
    }
}

struct SuperHeroItemView_Previews: PreviewProvider {
    static var previews: some View {
        SuperHeroItemView(superHero: dev.superHero, superHeroViewModel: dev.superHeroViewModel)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
