//
//  Order.swift
//  Network
//
//  Created by user279425 on 12/20/25.
//

import Foundation

struct Order: Codable {
    let id: Int
    let date: String
    let totalPrice: Double
    let status: String
    let productId: Int
}
