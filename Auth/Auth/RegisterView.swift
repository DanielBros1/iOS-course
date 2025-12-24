//
//  RegisterView.swift
//  Auth
//
//  Created by user279425 on 12/24/25.
//

import SwiftUI

struct RegisterView: View {

    @State private var email = ""
    @State private var password = ""
    @State private var message = ""

    let authService = AuthService()

    var body: some View {
        VStack(spacing: 16) {

            Text("Rejestracja")
                .font(.title)

            TextField("Email", text: $email)
                .textFieldStyle(.roundedBorder)

            SecureField("Password", text: $password)
                .textFieldStyle(.roundedBorder)

            Button("Zarejestruj") {
                authService.register(email: email, password: password) { success in
                    DispatchQueue.main.async {
                        message = success ? "Rejestracja OK" : "Błąd rejestracji"
                    }
                }
            }

            Text(message)
                .foregroundColor(.blue)
        }
        .padding()
    }
}
