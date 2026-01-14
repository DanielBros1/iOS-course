//
//  MockPaymentService.swift
//  stripe
//
//  Created by user279425 on 1/14/26.
//


final class MockPaymentService: PaymentService {    func createPaymentIntent(amount: Int) async throws -> String {        try await Task.sleep(nanoseconds: 800_000_000)        return "mock_client_secret_\(UUID().uuidString)"    }    func confirmPayment(clientSecret: String) async throws -> PaymentStatus {        try await Task.sleep(nanoseconds: 800_000_000)        return .paid    }}