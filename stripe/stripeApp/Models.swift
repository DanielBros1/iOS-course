//
//  Models.swift
//  stripeApp
//
//  Created by user279425 on 1/17/26.
//

import Foundation

struct Product: Identifiable {
    let id = UUID()
    let name: String
    let price: Int
}

enum PaymentStatus: String {
    case pending = "Oczekuje"
    case paid = "Opłacono"
    case failed = "Błąd"
}


struct PurchasedItem: Identifiable {
    let id = UUID()
    let product: Product
    let date = Date()
}
