//
//  DataController.swift
//  ShoppingList
//
//  Created by user279425 on 12/13/25.
//

import CoreData


class DataController {
static let shared = DataController()


let container: NSPersistentContainer


init() {
    container = NSPersistentContainer(name: "ShoppingModel")
    container.loadPersistentStores { _, error in
        if let error = error {
            fatalError(error.localizedDescription)
        }
    }


    preloadData()
}


func preloadData() {
    let context = container.viewContext
    let request: NSFetchRequest<Category> = Category.fetchRequest()
    let count = (try? context.count(for: request)) ?? 0

    guard count == 0 else { return }

    let food = Category(context: context)
    food.id = UUID()
    food.name = "Jedzenie"

    let apple = Product(context: context)
    apple.id = UUID()
    apple.name = "Jabłko"
    apple.price = 1.99
    apple.desc = "Świeże czerwone jabłko"
    apple.category = food


    let bread = Product(context: context)
    bread.id = UUID()
    bread.name = "Chleb"
    bread.price = 4.50
    bread.desc = "Chleb pełnoziarnisty"
    bread.category = food

    try? context.save()
    }
}
