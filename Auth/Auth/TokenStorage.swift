//
//  TokenStorage.swift
//  Auth
//
//  Created by user279425 on 1/4/26.
//

import Foundation

final class TokenStorage {
    static let shared = TokenStorage()
    private let key = "jwt_token"

    func save(token: String) {
        UserDefaults.standard.set(token, forKey: key)
    }

    func get() -> String? {
        UserDefaults.standard.string(forKey: key)
    }

    func clear() {
        UserDefaults.standard.removeObject(forKey: key)
    }
}
