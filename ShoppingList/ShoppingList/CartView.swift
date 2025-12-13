//
//  CartView.swift
//  ShoppingList
//
//  Created by user279425 on 12/13/25.
//

import SwiftUI

struct CartView: View {
    @EnvironmentObject var cart: CartViewModel

    var body: some View {
        NavigationView {
            List {
                ForEach(cart.items) {
                    item in HStack {
                        Text(item.product.name ? ?"Nieznany produkt") Spacer() Text("Liczba: \( item.quantity )") Text(String(format: "%.2f zł", item.product.price * Double(item.quantity)))
                    }
                }
                Text("Łączna suma: \( String(format: "%.2f zł", cart.totalPrice()))").font(.headline)
            }.navigationTitle("Koszyk")
        }
    }
}