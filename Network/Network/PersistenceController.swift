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

    func importFromAPI() async {
        let context = container.viewContext

        do {
            let categories = try await APIService.shared.fetchCategories()
            let products = try await APIService.shared.fetchProducts()
            var categoryMap: [Int64: CategoryEntity] = [:]

            for apiCategory in categories {
                let category = CategoryEntity(context: context)
                category.id = apiCategory.id
                category.name = apiCategory.name
                categoryMap[apiCategory.id] = category
            }

            for apiProduct in products {
                let product = ProductEntity(context: context)
                product.id = apiProduct.id
                product.name = apiProduct.name
                product.price = apiProduct.price
                product.category = categoryMap[apiProduct.categoryId]
            }

            try context.save()
            print("✅ API → CoreData OK")
        } catch {
            print("API import error:", error)
        }
    }
}

extension PersistenceController {
    func clearAllData() {
        let context = container.viewContext
        let entities = ["ProductEntity", "CategoryEntity", "OrderEntity"]

        for entity in entities {
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entity)
            let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)

            do {
                try container.persistentStoreCoordinator.execute(deleteRequest, with: context)
            } catch {
                print("Failed to clear \(entity):", error)
            }
        }
        print("🧹 CoreData cleared")
    }
}

