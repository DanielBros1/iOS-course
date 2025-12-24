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

            Text(message)
                .foregroundColor(.blue)
        }
        .padding()
    }
}
