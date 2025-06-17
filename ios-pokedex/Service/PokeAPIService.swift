//
//  PokeAPIService.swift
//  ios-pokedex
//
//  Created by Miguel Moura on 15/06/25.
//

import Foundation

class PokeAPIService {
    
    func fetchPokemonList(completion: @escaping (Result<[PokemonResult], Error>) -> Void) {
        let urlString = "https://pokeapi.co/api/v2/pokemon?limit=151"
        
        guard let url = URL(string: urlString) else {
            completion(.failure(URLError(.badURL)))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(URLError(.badServerResponse)))
                return
            }
            
            do {
                let decoded = try JSONDecoder().decode(PokemonListResponse.self, from: data)
                completion(.success(decoded.results))
            } catch {
                completion(.failure(error))
            }
            
        }.resume()
    }
}

