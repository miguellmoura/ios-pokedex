//
//  ios_pokedexApp.swift
//  ios-pokedex
//
//  Created by Miguel Moura on 15/06/25.
//

import SwiftUI

@main
struct ios_pokedexApp: App {
    @AppStorage("usuarioLogadoEmail") var emailLogado: String = ""

        var body: some Scene {
            WindowGroup {
                NavigationStack {
                    if emailLogado.isEmpty {
                        LoginView()
                    } else {
                        HomeView() 
                    }
                }
            }
        }
}
