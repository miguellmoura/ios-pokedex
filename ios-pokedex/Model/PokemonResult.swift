//
//  PokemonResult.swift
//  ios-pokedex
//
//  Created by Miguel Moura on 15/06/25.
//

import Foundation

struct PokemonResult: Codable, Identifiable {
    let name: String
    let url: String
    var id: String { url }
}
