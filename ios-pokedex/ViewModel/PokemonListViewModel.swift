//
//  PokemonListViewModel.swift
//  ios-pokedex
//
//  Created by Miguel Moura on 15/06/25.
//

import SwiftUI

class PokemonListViewModel: ObservableObject {
    
    @Published var pokemons: [PokemonResult] = []
    @Published var isLoading = false
    @Published var errorMessage: String? = nil
    
    private let service = PokeAPIService()
    
    func loadPokemons() {
        isLoading = true
        errorMessage = nil
        
        service.fetchPokemonList { result in
            DispatchQueue.main.async {
                self.isLoading = false
                switch result {
                case .success(let pokemons):
                    self.pokemons = pokemons
                case .failure(let error):
                    self.errorMessage = error.localizedDescription
                }
            }
        }
    }
}

