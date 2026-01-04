//
//  OAuthService.swift
//  Auth
//
//  Created by user279425 on 1/4/26.
//

import AuthenticationServices
import UIKit

final class OAuthService {
    private static var session: ASWebAuthenticationSession?

    static func start(provider: String) {
        guard let url = URL(string: "http://localhost:4000/auth/\(provider)") else { return }

        session = ASWebAuthenticationSession(
            url: url,
            callbackURLScheme: "myapp"
        ) { callbackURL, error in
            guard
                error == nil,
                let callbackURL,
                let components = URLComponents(url: callbackURL, resolvingAgainstBaseURL: false),
                let token = components.queryItems?
                    .first(where: { $0.name == "token" })?
                    .value
            else {
                return
            }

            TokenStorage.shared.save(token: token)
        }

        session?.start()
    }
}
