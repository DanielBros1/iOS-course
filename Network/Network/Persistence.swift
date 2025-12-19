//
//  Persistence.swift
//  Network
//
//  Created by user279425 on 12/19/25.
//

import CoreData

struct Persistence {
    static let shared = Persistence()

    let container: NSPersistentContainer

    init() {
        container = NSPersistentContainer(name: "Network")
        container.loadPersistentStores { _, error in
            if let error = error {
                fatalError("CoreData error: \(error)")
            }
        }
    }
}
