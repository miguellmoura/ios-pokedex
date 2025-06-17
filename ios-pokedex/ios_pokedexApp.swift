//
//  ios_pokedexApp.swift
//  ios-pokedex
//
//  Created by Miguel Moura on 15/06/25.
//

import SwiftUI

@main
struct ios_pokedexApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            HomeView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
