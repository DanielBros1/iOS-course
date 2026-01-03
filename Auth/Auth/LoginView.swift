//
//  LoginView.swift
//  Auth
//
//  Created by user279425 on 12/24/25.
//

import SwiftUI


struct LoginView: View {

    @State private var email = ""
    @State private var password = ""
    @State private var message = ""

    let authService = AuthService()
    let oauthManager = OAuthManager()


    var body: some View {
        VStack(spacing: 16) {
            TextField("Email", text: $email)
                .textFieldStyle(.roundedBorder)

            SecureField("Password", text: $password)
                .textFieldStyle(.roundedBorder)

            Button("Zaloguj") {
                authService.login(email: email, password: password) { success in
                    DispatchQueue.main.async {
                        message = success ? "Zalogowano" : "Błąd logowania"
                    }
                }
            }
            
            Divider()

            Button("Logowanie przez Google") {
                OAuthService.start(provider: "google")
            }

            Button("Logowanie przez GitHub") {
                OAuthService.start(provider: "github")
            }
            
            Text(message)
                .foregroundColor(.blue)
        }
        .padding()
    }
}
