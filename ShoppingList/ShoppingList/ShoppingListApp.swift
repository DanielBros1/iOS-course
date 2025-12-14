//
//  ShoppingListApp.swift
//  ShoppingList
//
//  Created by user279425 on 12/14/25.
//

import SwiftUI
import CoreData

@main
struct ShoppingListApp: App {

    let dataController = DataController.shared
    @StateObject var cart = CartViewModel()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext,
                              dataController.container.viewContext)
                .environmentObject(cart)
        }
    }
}
