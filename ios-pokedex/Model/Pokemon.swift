//
//  Pokemon.swift
//  ios-pokedex
//
//  Created by Miguel Moura on 15/06/25.
//

import Foundation

struct Pokemon: Identifiable {
    let id = UUID()
    let nome: String
    let tipo: String
    let descricao: String
}
