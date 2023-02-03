//
//  SuperHeroItemView.swift
//  SuperHeroGrid
//
//  Created by Derlis Ramón Cañete Ríos on 2023-02-02.
//

import SwiftUI

struct SuperHeroItemView: View {
    // MARK: - Properties
    var superHero: SuperHeroModel
    
    @ObservedObject var superHeroViewModel: SuperHeroViewModel
    @State private var imageHidden: Bool = false
    
    
    // MARK: - Body
    var body: some View {
        if imageHidden {
            Button( action: {
                imageHidden.toggle()
            }) {
                VStack {
                    Image(systemName: Icons.eyeFill.filledIcon)
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(Color.blue)
                        .frame(width: 50, height: 50)
                    Text("Show Image")
                        .font(.system(size: 15))
                        .foregroundColor(Color.blue)
                        .fontWeight(.bold)
                }
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
                            ItemButtonView(icon: Icons.eyeSlashFill.filledIcon, color: .blue)
                        }
                        .background(
                            Circle()
                                .foregroundColor(.white)
                        )
                        
                        Button {
                            superHeroViewModel.deleteSuperHero(superHero: superHero)
                        } label: {
                            ItemButtonView(icon: Icons.minusFill.filledIcon, color: .red)
                        }
                        .background(
                            Circle()
                                .foregroundColor(.white)
                        )
                    }
                    .offset(y: -10)
                    
                    Spacer()
                    
                    VStack(alignment: .leading, spacing: 8) {

                        nameTextView
                        
                        VStack(alignment: .leading, spacing: 4) {
                            
                            heightTextView
                            
                            weightTextView
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

// MARK: - Extension
extension SuperHeroItemView {
    
    private var nameTextView: some View {
        Text(superHero.name ?? "")
            .font(.system(size: 20))
            .fontWeight(.heavy)
            .lineLimit(1)
            .foregroundColor(.white)
            .multilineTextAlignment(.leading)
    }
    
    private var heightTextView: some View {
        Text(superHero.height)
            .modifier(ItemTextModifier())
    }
    
    private var weightTextView: some View {
        Text(superHero.weight)
            .modifier(ItemTextModifier())
    }
}


// MARK: - Preview
struct SuperHeroItemView_Previews: PreviewProvider {
    
    static var previews: some View {
        SuperHeroItemView(superHero: dev.superHero, superHeroViewModel: dev.superHeroViewModel)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
