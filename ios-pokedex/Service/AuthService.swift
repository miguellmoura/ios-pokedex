//
//  AuthService.swift
//  ios-pokedex
//
//  Created by Miguel Moura on 17/06/25.
//

import Foundation
import CoreData

class AuthService {
    static let shared = AuthService()
    private let context = PersistenceController.shared.container.viewContext

    func cadastrar(nome: String, email: String, senha: String) -> Bool {
        guard !usuarioExiste(email: email) else { return false }

        let novo = Usuario(context: context)
        novo.id = UUID()
        novo.nomeDeUsuario = nome
        novo.email = email
        novo.senha = senha

        try? context.save()
        return true
    }

    func login(email: String, senha: String) -> Bool {
        let request: NSFetchRequest<Usuario> = Usuario.fetchRequest()
        request.predicate = NSPredicate(format: "email == %@ AND senha == %@", email, senha)

        if let resultado = try? context.fetch(request), let usuario = resultado.first {
            UserSession.shared.login(email: usuario.email!, nome: usuario.nomeDeUsuario!)
            return true
        }

        return false
    }

    func usuarioExiste(email: String) -> Bool {
        let request: NSFetchRequest<Usuario> = Usuario.fetchRequest()
        request.predicate = NSPredicate(format: "email == %@", email)
        let count = (try? context.count(for: request)) ?? 0
        return count > 0
    }
}

