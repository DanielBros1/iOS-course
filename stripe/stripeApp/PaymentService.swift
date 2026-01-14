//
//  PaymentService.swift
//  stripe
//
//  Created by user279425 on 1/14/26.
//

protocol PaymentService {
    func createPaymentIntent(amount: Int) async throws -> String
    func confirmPayment(clientSecret: String) async throws -> PaymentStatus
}
