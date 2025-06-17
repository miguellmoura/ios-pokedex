//
//  UserSession.swift
//  ios-pokedex
//
//  Created by Miguel Moura on 17/06/25.
//

import Foundation
import SwiftUI

class UserSession: ObservableObject {
    static let shared = UserSession()

    @AppStorage("usuarioLogadoEmail") var emailLogado: String = ""
    @AppStorage("usuarioLogadoNome") var nomeLogado: String = ""
    
    var estaLogado: Bool {
        !emailLogado.isEmpty
    }

    func login(email: String, nome: String) {
        emailLogado = email
        nomeLogado = nome
    }

    func logout() {
        emailLogado = ""
        nomeLogado = ""
    }
}
