//
//  NetworkApp.swift
//  Network
//
//  Created by user279425 on 12/20/25.
//

import SwiftUI
internal import CoreData

@main
struct NetworkApp: App {

    let persistenceController = PersistenceController.shared

    init() {
        persistenceController.testCoreData()
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext,
                              persistenceController.container.viewContext)
        }
    }
}
