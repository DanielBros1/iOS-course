//
//  NetworkApp.swift
//  Network
//
//  Created by user279425 on 12/19/25.
//

import SwiftUI
import CoreData

@main
struct NetworkApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
