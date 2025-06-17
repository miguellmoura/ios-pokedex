//
//  Usuario+CoreDataProperties.swift
//  ios-pokedex
//
//  Created by Miguel Moura on 17/06/25.
//
//

import Foundation
import CoreData


extension Usuario {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Usuario> {
        return NSFetchRequest<Usuario>(entityName: "Usuario")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var nomeDeUsuario: String?
    @NSManaged public var email: String?
    @NSManaged public var senha: String?

}

extension Usuario : Identifiable {

}
