//
//  PokemonFavorito+CoreDataProperties.swift
//  ios-pokedex
//
//  Created by Miguel Moura on 16/06/25.
//
//

import Foundation
import CoreData


extension PokemonFavorito {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<PokemonFavorito> {
        return NSFetchRequest<PokemonFavorito>(entityName: "PokemonFavorito")
    }

    @NSManaged public var name: String?
    @NSManaged public var url: String?
    @NSManaged public var usuario: String?

    
}

extension PokemonFavorito : Identifiable {

}
