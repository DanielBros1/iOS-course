//
//  ProductDetailView.swift
//  ShoppingList
//
//  Created by user279425 on 12/14/25.
//

import SwiftUI

struct ProductDetailView: View {
    let product: Product
    @EnvironmentObject var cart: CartViewModel

    var body: some View {
        VStack(spacing: 16) {
            Text(product.name ?? "").font(.title)
            Text(product.desc ?? "")
            Text("Cena: \(product.price, specifier: "%.2f") zł")
            Button("Dodaj do koszyka") {
                cart.add(product: product)
            }
            .buttonStyle(.borderedProminent)
        }.padding()
    }
}
