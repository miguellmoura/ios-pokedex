import Foundation
import CoreData
import SwiftUI

class FavoritoService {
    
    static let shared = FavoritoService()
    private let context = PersistenceController.shared.container.viewContext
    
    func adicionarFavorito(name: String, url: String) {
        let favorito = PokemonFavorito(context: context)
        favorito.name = name
        favorito.url = url
        
        salvarContexto()
    }
    
    func removerFavorito(pokemonName: String) {
        let request: NSFetchRequest<PokemonFavorito> = PokemonFavorito.fetchRequest()
        request.predicate = NSPredicate(format: "name == %@", pokemonName)
        
        if let resultados = try? context.fetch(request) {
            for favorito in resultados {
                context.delete(favorito)
            }
            salvarContexto()
        }
    }
    
    func listarFavoritos() -> [PokemonFavorito] {
        let request: NSFetchRequest<PokemonFavorito> = PokemonFavorito.fetchRequest()
        return (try? context.fetch(request)) ?? []
    }
    
    func ehFavorito(pokemonName: String) -> Bool {
        let request: NSFetchRequest<PokemonFavorito> = PokemonFavorito.fetchRequest()
        request.predicate = NSPredicate(format: "name == %@", pokemonName)
        let count = (try? context.count(for: request)) ?? 0
        return count > 0
    }

    // MARK: - Helpers using PokemonResult

    /// Adds a PokemonResult to favorites using its name and url.
    func adicionarFavorito(pokemon: PokemonResult) {
        adicionarFavorito(name: pokemon.name, url: pokemon.url)
    }

    /// Removes a PokemonResult from favorites.
    func removerFavorito(pokemon: PokemonResult) {
        removerFavorito(pokemonName: pokemon.name)
    }

    /// Checks if a PokemonResult is already favorited.
    func ehFavorito(pokemon: PokemonResult) -> Bool {
        ehFavorito(pokemonName: pokemon.name)
    }
    
    private func salvarContexto() {
        do {
            try context.save()
        } catch {
            print("Erro ao salvar: \(error.localizedDescription)")
        }
    }
}

