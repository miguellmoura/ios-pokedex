//
//  ContentView.swift
//  ios-pokedex
//
//  Created by Miguel Moura on 15/06/25.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    var body: some View {
        NavigationView {
            List {
                Text("Bulbasaur")
                Text("Charmander")
                Text("Squirtle")
            }
            .navigationTitle("Pokédex")
        }
    }
    
}

#Preview {
    ContentView()
}
