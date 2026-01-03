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
            
            HStack {
                            Rectangle().frame(height: 1).foregroundColor(.gray.opacity(0.3))
                            Text("LUB").font(.caption).foregroundColor(.gray)
                            Rectangle().frame(height: 1).foregroundColor(.gray.opacity(0.3))
                        }
                        Button(action: googleLoginAction) {
                            HStack {
                                Image(systemName: "globe")
                                Text("Kontynuuj z Google")
                                    .fontWeight(.medium)
                            }
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.white)
                            .foregroundColor(.black)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.gray.opacity(0.3), lineWidth: 1)
                            )
                        }
            
            
            Text(message)
                .foregroundColor(.blue)
        }
        .padding()
    }
    
    func googleLoginAction() {
            isLoading = true
            // example account
            authService.login(email: "eve.holt@reqres.in", password: "pistol") { success in
                DispatchQueue.main.async {
                    isLoading = false
                    message = success ? "Zalogowano przez Google" : "Błąd autoryzacji Google"
                }
            }
        }
}
