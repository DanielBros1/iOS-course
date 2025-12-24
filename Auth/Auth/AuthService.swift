//
//  Untitled.swift
//  Auth
//
//  Created by user279425 on 12/24/25.
//

import Foundation

struct LoginResponse: Codable {
    let token: String
}

final class AuthService {

    func login(email: String, password: String, completion: @escaping (Bool) -> Void) {

        let url = URL(string: "https://example.com/login")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        let body = [
            "email": email,
            "password": password
        ]

        request.httpBody = try? JSONSerialization.data(withJSONObject: body)

        URLSession.shared.dataTask(with: request) { data, _, _ in
            guard let data else {
                completion(false)
                return
            }

            if let response = try? JSONDecoder().decode(LoginResponse.self, from: data) {
                KeychainService.save(token: response.token)
                completion(true)
            } else {
                completion(false)
            }
        }.resume()
    }
}
