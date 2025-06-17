//
//  PokemonDetailView.swift
//  ios-pokedex
//
//  Created by Miguel Moura on 15/06/25.
//

import SwiftUI

struct PokemonDetailView: View {
    let pokemon: PokemonResult
    @StateObject private var viewModel = PokemonDetailViewModel()
    
    var body: some View {
        VStack {
            if viewModel.isLoading {
                ProgressView("Carregando detalhes...")
            } else if let error = viewModel.errorMessage {
                Text("Erro: \(error)")
            } else if let detail = viewModel.detail {
                VStack(spacing: 20) {
                    if let imageUrl = detail.sprites.front_default,
                       let url = URL(string: imageUrl) {
                        AsyncImage(url: url) { image in
                            image
                                .resizable()
                                .scaledToFit()
                                .frame(width: 150, height: 150)
                        } placeholder: {
                            ProgressView()
                        }
                    }
                    
                    Text(detail.name.capitalized)
                        .font(.largeTitle)
                        .bold()
                    
                    Text("Altura: \(detail.height)")
                    Text("Peso: \(detail.weight)")
                    
                    VStack {
                        Text("Tipos:")
                            .bold()
                        ForEach(detail.types, id: \.type.name) { typeEntry in
                            Text(typeEntry.type.name.capitalized)
                        }
                    }
                    
                    Spacer()
                }
                .padding()
            }
        }
        .onAppear {
            viewModel.loadDetail(from: pokemon.url)
        }
        .navigationTitle(pokemon.name.capitalized)
    }
}


