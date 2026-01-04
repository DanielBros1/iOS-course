//
//  AuthApp.swift
//  Auth
//
//  Created by user279425 on 12/24/25.
//

import SwiftUI

@main
struct AuthApp: App {
    var body: some Scene {
        WindowGroup {
            TabView {
                LoginView()
                    .tabItem {
                        Label("Login", systemImage: "person.fill")
                    }

                RegisterView()
                    .tabItem {
                        Label("Register", systemImage: "person.badge.plus")
                    }
            }
            .onOpenURL { url in
                guard
                    let components = URLComponents(url: url, resolvingAgainstBaseURL: false),
                    let token = components.queryItems?
                        .first(where: { $0.name == "token" })?
                        .value
                else { return }

                TokenStorage.shared.save(token: token)
            }
        }
    }
}
