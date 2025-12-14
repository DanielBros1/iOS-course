//
//  CartViewModel.swift
//  ShoppingList
//
//  Created by user279425 on 12/13/25.
//

import SwiftUI
import Combine

class CartViewModel: ObservableObject {
    @Published var items: [CartItem] = []

    func add(product: Product) {
        if let index = items.firstIndex(where: { $0.product == product }) {
            items[index].quantity += 1
        } else {
            let newItem = CartItem(product: product, quantity: 1)
            items.append(newItem)
        }
    }
    var totalPrice: Double {
        items.reduce(0) { $0 + ($1.product.price * Double($1.quantity)) }
    }
}
