//
//  AuthApi.swift
//  Auth
//
//  Created by user279425 on 1/4/26.
//

import Foundation

struct AuthAPI {

    static func login(email: String, password: String) async throws -> String {
        let url = URL(string: "http://localhost:4000/local/login")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        let body = ["email": email, "password": password]
        request.httpBody = try JSONSerialization.data(withJSONObject: body)

        let (data, _) = try await URLSession.shared.data(for: request)
        let response = try JSONDecoder().decode(AuthResponse.self, from: data)
        return response.token
    }

    static func register(name: String, email: String, password: String) async throws {
        let url = URL(string: "http://localhost:4000/local/register")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        let body = ["name": name, "email": email, "password": password]
        request.httpBody = try JSONSerialization.data(withJSONObject: body)

        _ = try await URLSession.shared.data(for: request)
    }
}
