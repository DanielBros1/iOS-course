//
//  ProductListVIew.swift
//  Network
//
//  Created by user279425 on 12/21/25.
//

import SwiftUI
internal import CoreData

struct ProductListView: View {

    @Environment(\.managedObjectContext) private var context
    @State private var showAddProduct = false

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \ProductEntity.name, ascending: true)]
    )
    private var products: FetchedResults<ProductEntity>

    var body: some View {
        NavigationView {
            List(products) { product in
                VStack(alignment: .leading) {
                    Text(product.name ?? "")
                        .font(.headline)
                    Text(String(format: "Price: %.2f", product.price))
                    Text(product.category?.name ?? "")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
            }
            .navigationTitle("Products")
            
            // Dodawanie nowego produktu
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        showAddProduct = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $showAddProduct) {
                AddProductView()
                    .environment(\.managedObjectContext, context)
            }
        }
    }
}
