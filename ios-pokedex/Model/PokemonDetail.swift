//
//  PokemonDetail.swift
//  ios-pokedex
//
//  Created by Miguel Moura on 15/06/25.
//

import Foundation

struct PokemonDetail: Codable {
    let id: Int
    let name: String
    let height: Int
    let weight: Int
    let sprites: Sprites
    let types: [PokemonTypeEntry]
}
