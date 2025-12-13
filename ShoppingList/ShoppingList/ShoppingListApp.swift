//
//  ShoppingListApp.swift
//  ShoppingList
//
//  Created by user279425 on 12/13/25.
//

import SwiftUI
import CoreData

@main
struct ShoppingListApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
