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
                ForEach(cart.items) { item in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(item.product.name ?? "Nieznany produkt").font(.headline)
                            Text("Ilość: \(item.quantity)").font(.subheadline).foregroundColor(.gray)
                        }
                        Spacer()
                        Text(String(format: "%.2f zł", item.product.price * Double(item.quantity)))
                    }
                }
                HStack {
                    Text("Łączna cena:").font(.headline)
                    Spacer()
                    Text(String(format: "%.2f zł", cart.totalPrice)).font(.headline)
                }
            }
            .navigationTitle("Koszyk")
        }
    }
}

