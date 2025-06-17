//
//  HomeView.swift
//  ios-pokedex
//
//  Created by Miguel Moura on 15/06/25.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                Text("Bem-vindo à Pokédex!")
                    .font(.largeTitle)
                    .bold()
                
                NavigationLink("Ver Lista de Pokémons", destination: ListaPokemonsView())
                NavigationLink("Ver Favoritos", destination: FavoritosView())
            }
            .padding()
        }
    }
}
