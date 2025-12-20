//
//  Persistence.swift
//  Network
//
//  Created by user279425 on 12/19/25.
//

internal import CoreData

struct PersistenceController {
    static let shared = PersistenceController()

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

extension PersistenceController {

    func testCoreData() {
        let context = container.viewContext

        let category = CategoryEntity(context: context)
        category.id = 1
        category.name = "Test Category"

        let product = ProductEntity(context: context)
        product.id = 1
        product.name = "Test Product"
        product.price = 99.99
        product.category = category

        let order = OrderEntity(context: context)
        order.id = 1
        order.status = "PAID"
        order.totalPrice = 99.99
        order.product = product

        do {
            try context.save()
            print("✅ CoreData TEST OK")
        } catch {
            print("❌ CoreData TEST ERROR:", error)
        }
    }
}
