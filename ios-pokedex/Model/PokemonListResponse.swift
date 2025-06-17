//
//  PokemonListResponse.swift
//  ios-pokedex
//
//  Created by Miguel Moura on 15/06/25.
//

import Foundation

struct PokemonListResponse: Codable {
    let results: [PokemonResult]
}
