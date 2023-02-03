//
//  SuperHeroItemView.swift
//  SuperHeroGrid
//
//  Created by Derlis Ramón Cañete Ríos on 2023-02-02.
//

import SwiftUI

struct SuperHeroItemView: View {
    
    var superHero: SuperHeroModel
    
    @ObservedObject var superHeroViewModel: SuperHeroViewModel
    @State private var imageHidden: Bool = false
    
    var body: some View {
        if imageHidden {
            Button( action: {
                imageHidden.toggle()
            }) {
                Text("Image Hidden")
                    .font(.system(size: 14))
                    .foregroundColor(Color.blue)
            }
            .frame(height: 240,alignment: .center)
        } else {
            ZStack {
                AsyncImage(url: URL(string: superHero.images?.sm ?? "")) { image in
                    image
                        .resizable()
                        .scaledToFit()
                        .cornerRadius(12)
                } placeholder: {
                    ProgressView()
                }
                VStack(alignment: .leading) {
                    HStack(alignment: .center, spacing: 20) {
                        Spacer()
                        
                        Button {
                            imageHidden.toggle()
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
                        
                        Button {
                            superHeroViewModel.deleteSuperHero(superHero: superHero)
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
                            Text(superHero.height)
                                .font(.caption2)
                                .fontWeight(.semibold)
                                .foregroundColor(.white)
                            
                            Text(superHero.weight)
                                .font(.caption2)
                                .fontWeight(.semibold)
                                .foregroundColor(.white)
                        }
                    }
                }
                .padding(.leading, 10)
                .padding(.bottom)
            }
            .frame(width: 160, height: 240)
            .disabled(imageHidden)
        }
    }
}

struct SuperHeroItemView_Previews: PreviewProvider {
    
    static var previews: some View {
        SuperHeroItemView(superHero: dev.superHero, superHeroViewModel: dev.superHeroViewModel)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
