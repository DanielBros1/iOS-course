//
//  Persistence.swift
//  Network
//
//  Created by user279425 on 12/19/25.
//

import CoreData

struct PersistenceController {
    static let shared = PersistenceController()

    let container: NSPersistentContainer

    init() {
        container = NSPersistentContainer(name: "ShopModel")
        container.loadPersistentStores { _, error in
            if let error = error {
                fatalError("CoreData error \(error)")
            }
        }
    }
}
