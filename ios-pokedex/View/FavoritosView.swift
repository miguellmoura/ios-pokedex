import SwiftUI

struct FavoritosView: View {
    @State private var favoritos: [PokemonFavorito] = []
    @State private var busca: String = ""

    var body: some View {
        NavigationStack {
            VStack {
                // Campo de busca
                TextField("Buscar Pokémon...", text: $busca)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()

                // Lista de favoritos
                List {
                    ForEach(favoritosFiltrados(), id: \.self) { favorito in
                        HStack {
                            Text(favorito.name?.capitalized ?? "Sem nome")
                            Spacer()
                            Button(action: {
                                remover(favorito: favorito)
                            }) {
                                Image(systemName: "trash")
                                    .foregroundColor(.red)
                            }
                        }
                    }
                }
                .listStyle(.plain)
            }
            .navigationTitle("Favoritos")
            .onAppear {
                carregarFavoritos()
            }
        }
    }

    private func carregarFavoritos() {
        favoritos = FavoritoService.shared.listarFavoritos()
    }

    private func remover(favorito: PokemonFavorito) {
        FavoritoService.shared.removerFavorito(pokemonName: favorito.name ?? "")
        carregarFavoritos()
    }

    private func favoritosFiltrados() -> [PokemonFavorito] {
        if busca.isEmpty {
            return favoritos
        } else {
            return favoritos.filter {
                $0.name?.lowercased().contains(busca.lowercased()) ?? false
            }
        }
    }
}
