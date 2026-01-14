//
//  Payment.swift
//  stripe
//
//  Created by user279425 on 1/9/26.
//

import Foundation

struct Payment: Identifiable, Codable {
    let id: UUID
    let productId: UUID
    let amount: Int
    let status: PaymentStatus
    let createdAt: Date
}
