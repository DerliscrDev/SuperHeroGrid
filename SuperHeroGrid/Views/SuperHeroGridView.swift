//
//  ContentView.swift
//  SuperHeroGrid
//
//  Created by Derlis Ramón Cañete Ríos on 2023-02-02.
//

import SwiftUI

struct SuperHeroGridView: View {
    
    // MARK: - Properties
    @ObservedObject private var superHeroViewModel = SuperHeroViewModel()
    @State private var isHidden: Bool = true
    
    let rowSpacing: CGFloat = 30
    var gridLayout: [GridItem] {
        return Array(repeating: GridItem(.flexible(), spacing: rowSpacing), count: 2)
    }
    
    
    // MARK: - Body
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 0) {
                    LazyVGrid(columns: gridLayout, spacing: rowSpacing, content: {
                        ForEach(superHeroViewModel.superHeros) { superHero in
                                SuperHeroItemView(superHero: superHero, superHeroViewModel: superHeroViewModel)
                        }
                    })
                    .padding(20)
                }
                .navigationTitle("Super Hero App")
                .navigationBarTitleDisplayMode(.large)
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        menuView
                            
                    }
                }
            }
            .background(MotionAnimationView())
        }
        .onAppear {
            superHeroViewModel.fetchSuperHeros()
        }
    }
}

// MARK: - Extension
extension SuperHeroGridView {
    
    private var menuView: some View {
        Menu {
            Button {
                superHeroViewModel.sortByName()
            } label: {
                Text("Sort by Name")
            }
            
            Button {
                superHeroViewModel.sortByIntelligence()
            } label: {
                Text("Sort by Intelligence")
            }
            
            Button {
                superHeroViewModel.sortByStrength()
            } label: {
                Text("Sort by Strength")
            }
            
            Button {
                superHeroViewModel.sortBySpeed()
            } label: {
                Text("Sort by Speed")
            }
            
            Button {
                superHeroViewModel.sortByDurability()
            } label: {
                Text("Sort by Durability")
            }
            
            Button {
                superHeroViewModel.sortByPower()
            } label: {
                Text("Sort by Power")
            }
            
            Button {
                superHeroViewModel.sortByCombat()
            } label: {
                Text("Sort by Combat")
            }
        } label: {
            Image(systemName: "line.3.horizontal")
                .font(.system(size: 28))
                .foregroundColor(.white)
        }
    }
}

// MARK: - Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SuperHeroGridView()
            .preferredColorScheme(.dark)
    }
}
