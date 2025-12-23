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
        container.viewContext.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
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
                let category = fetchCategory(byId: apiCategory.id, context: context)
                    ?? CategoryEntity(context: context)
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

extension PersistenceController {
    // To avoid category multiplication
    func fetchCategory(byId id: Int64,
                       context: NSManagedObjectContext) -> CategoryEntity? {

        let request = NSFetchRequest<CategoryEntity>(entityName: "CategoryEntity")
        request.predicate = NSPredicate(format: "id == %d", id)
        request.fetchLimit = 1

        return try? context.fetch(request).first
    }
}

