//
//  PaymentStatus.swift
//  stripe
//
//  Created by user279425 on 1/9/26.
//

enum PaymentStatus: String, Codable {
    case pending
    case paid
    case failed
}
