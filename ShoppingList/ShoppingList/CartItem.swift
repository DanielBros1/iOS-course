//
//  CartItem.swift
//  ShoppingList
//
//  Created by user279425 on 12/13/25.
//

import Foundation

struct CartItem: Identifiable {
    let id = UUID()
    let product: Product
    var quantity: Int
}