//
//  KeychainService.swift
//  Auth
//
//  Created by user279425 on 12/24/25.
//

import Security
import Foundation

final class KeychainService {

    static func save(token: String) {
        let data = token.data(using: .utf8)!

        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecValueData as String: data,
            kSecAttrAccount as String: "authToken"
        ]

        SecItemDelete(query as CFDictionary)
        SecItemAdd(query as CFDictionary, nil)
    }
}
