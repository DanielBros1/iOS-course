//
//  AddProductView.swift
//  Network
//
//  Created by user279425 on 12/23/25.
//

import SwiftUI
internal import CoreData

struct AddProductView: View {

    @Environment(\.managedObjectContext) private var context
    @Environment(\.dismiss) private var dismiss

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \CategoryEntity.name, ascending: true)]
    )
    private var categories: FetchedResults<CategoryEntity>

    @State private var name = ""
    @State private var price = ""
    @State private var selectedCategory: CategoryEntity?

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Product")) {
                    TextField("Name", text: $name)
                    TextField("Price", text: $price)
                        .keyboardType(.decimalPad)
                }

                Section(header: Text("Category")) {
                    Picker("Category", selection: $selectedCategory) {
                        ForEach(categories) { category in
                            Text(category.name ?? "")
                                .tag(Optional(category))
                        }
                    }
                }
            }
            .navigationTitle("Add Product")
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        saveProduct()
                    }
                }

                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
            }
        }
    }

    private func saveProduct() {
        let product = ProductEntity(context: context)
        product.id = Int64(Date().timeIntervalSince1970)
        product.name = name
        product.price = Double(price) ?? 0
        product.category = selectedCategory

        try? context.save()
        dismiss()
    }
}

