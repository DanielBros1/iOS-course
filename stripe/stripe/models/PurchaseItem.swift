//
//  PurchaseItem.swift
//  stripe
//
//  Created by user279425 on 1/9/26.
//

import Foundation

struct PurchasedItem: Identifiable, Codable {
    let id: UUID
    let product: Product
    let payment: Payment
}
