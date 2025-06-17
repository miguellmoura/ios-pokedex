//
//  FavoritosView.swift
//  ios-pokedex
//
//  Created by Miguel Moura on 15/06/25.
//

import SwiftUI

struct FavoritosView: View {
    @State private var favoritos: [Favorito] = []
    
    var body: some View {
        NavigationStack {
            List(favoritos, id: \.self) { favorito in
                Text(favorito.name?.capitalized ?? "Sem nome")
            }
            .navigationTitle("Favoritos")
            .onAppear {
                favoritos = FavoritoService.shared.listarFavoritos()
            }
        }
    }
}
