//
//  ContentView.swift
//  SuperHeroGrid
//
//  Created by Derlis Ramón Cañete Ríos on 2023-02-02.
//

import SwiftUI

struct SuperHeroGridView: View {
    
    @ObservedObject private var viewModel = SuperHeroViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(viewModel.superHeros) { superHero in
                        NavigationLink {
                            SuperHeroDetailView(superHero: superHero)
                        } label: {
                            SuperHeroItemView(superHero: superHero)
                        }
                    }
                }
            }
            .navigationTitle("Super Heroes")
            .padding()
        }
        .onAppear {
            viewModel.fetchSuperHeros()
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SuperHeroGridView()
    }
}
