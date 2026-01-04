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
    @State private var isLoading = false

    var body: some View {
        VStack(spacing: 16) {

            TextField("Email", text: $email)
                .textFieldStyle(.roundedBorder)

            SecureField("Password", text: $password)
                .textFieldStyle(.roundedBorder)

            Button(isLoading ? "Logowanie..." : "Zaloguj") {
                Task {
                    isLoading = true
                    defer { isLoading = false }

                    do {
                        let token = try await AuthAPI.login(
                            email: email,
                            password: password
                        )
                        TokenStorage.shared.save(token: token)
                        message = "Zalogowano"
                    } catch {
                        message = "Błąd logowania"
                    }
                }
            }
            .disabled(isLoading)

            Divider()
            VStack(spacing: 16) {
                Button(action: {
                    OAuthService.start(provider: "google")
                }) {
                    HStack {
                        Image(systemName: "globe")
                        Text("Kontynuuj z Google")
                            .font(.headline)
                            .fontWeight(.semibold)
                    }
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.black)
                    .cornerRadius(12)
                }

                // --- Przycisk GitHub ---
                Button(action: {
                    OAuthService.start(provider: "github")
                }) {
                    HStack {
                        // Tymczasowa ikona
                        Image(systemName: "chevron.left.forwardslash.chevron.right")
                        
                        Text("Kontynuuj z GitHub")
                            .font(.headline)
                            .fontWeight(.semibold)
                    }
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.black)
                    .cornerRadius(12)
                }
            }

            Text(message)
                .foregroundColor(.blue)
        }
        .padding()
    }
}
