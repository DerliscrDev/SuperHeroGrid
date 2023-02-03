//
//  ContentView.swift
//  SuperHeroGrid
//
//  Created by Derlis Ramón Cañete Ríos on 2023-02-02.
//

import SwiftUI

struct SuperHeroGridView: View {
    
    @ObservedObject private var superHeroViewModel = SuperHeroViewModel()
    
    let rowSpacing: CGFloat = 30
    var gridLayout: [GridItem] {
        return Array(repeating: GridItem(.flexible(), spacing: rowSpacing), count: 2)
    }
    
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
                .navigationTitle("SuperHeroApp")
                .navigationBarTitleDisplayMode(.large)
            }
        }
        .onAppear {
            superHeroViewModel.fetchSuperHeros()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SuperHeroGridView()
    }
}
