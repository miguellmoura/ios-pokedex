//
//  ListaPokemonsView.swift
//  ios-pokedex
//
//  Created by Miguel Moura on 15/06/25.
//

import SwiftUI

struct ListaPokemonsView: View {
    @StateObject private var viewModel = PokemonListViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                if viewModel.isLoading {
                    ProgressView("Carregando...")
                } else if let error = viewModel.errorMessage {
                    Text("Erro: \(error)")
                } else {
                    List(viewModel.pokemons) { pokemon in
                        HStack {
                            NavigationLink(destination: PokemonDetailView(pokemon: pokemon)) {
                                Text(pokemon.name.capitalized)
                            }
                            Spacer()
                            Button(action: {
                                toggleFavorito(pokemon: pokemon)
                            }) {
                                Image(systemName: FavoritoService.shared.ehFavorito(pokemon: pokemon) ? "heart.fill" : "heart")
                                    .foregroundColor(.red)
                            }
                            .buttonStyle(PlainButtonStyle())
                        }
                    }
                }
            }
            .navigationTitle("Pokédex")
            .onAppear {
                viewModel.loadPokemons()
            }
        }
    }
    
    func toggleFavorito(pokemon: PokemonResult) {
        if FavoritoService.shared.ehFavorito(pokemon: pokemon) {
            FavoritoService.shared.removerFavorito(pokemon: pokemon)
        } else {
            FavoritoService.shared.adicionarFavorito(pokemon: pokemon)
        }
    }
}


