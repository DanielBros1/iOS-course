//
//  RegisterView.swift
//  Auth
//
//  Created by user279425 on 12/24/25.
//

import SwiftUI

struct RegisterView: View {

    @State private var name = ""
    @State private var email = ""
    @State private var password = ""
    @State private var message = ""
    @State private var isLoading = false

    var body: some View {
        VStack(spacing: 16) {

            Text("Rejestracja")
                .font(.title)

            TextField("Name", text: $name)
                .textFieldStyle(.roundedBorder)

            TextField("Email", text: $email)
                .textFieldStyle(.roundedBorder)

            SecureField("Password", text: $password)
                .textFieldStyle(.roundedBorder)

            Button(isLoading ? "Rejestracja..." : "Zarejestruj") {
                Task {
                    isLoading = true
                    defer { isLoading = false }

                    do {
                        try await AuthAPI.register(
                            name: name,
                            email: email,
                            password: password
                        )
                        message = "Rejestracja OK"
                    } catch {
                        message = "Błąd rejestracji"
                    }
                }
            }
            .disabled(isLoading)

            Text(message)
                .foregroundColor(.blue)
        }
        .padding()
    }
}
#Preview {
    RegisterView()
}
