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
        }
    }
}
