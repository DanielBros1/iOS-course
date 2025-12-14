//
//  ProductListView.swift
//  ShoppingList
//
//  Created by user279425 on 12/13/25.
//

import SwiftUI
import CoreData

struct ProductListView: View {
    @FetchRequest(
        entity: Product.entity(),
        sortDescriptors: [NSSortDescriptor(keyPath: \Product.name, ascending: true)]
    ) var products: FetchedResults<Product>

    @EnvironmentObject var cart: CartViewModel

    var body: some View {
        List {
            ForEach(products) { product in
                HStack {
                    VStack(alignment: .leading) {
                        Text(product.name ?? "Nieznany produkt").font(.headline)
                        Text(product.desc ?? "").font(.subheadline).foregroundColor(.gray)
                    }
                    Spacer()
                    Text(String(format: "%.2f zł", product.price))
                    Button(action: {
                        cart.add(product: product)
                    }) {
                        Image(systemName: "plus.circle").foregroundColor(.blue)
                    }.buttonStyle(BorderlessButtonStyle())
                }
            }
        }.navigationTitle("Produkty")
    }
}
