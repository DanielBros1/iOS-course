//
//  LoginViewController.swift
//  Auth
//
//  Created by user279425 on 12/24/25.
//

import UIKit

final class LoginViewController: UIViewController {

    let authService = AuthService()

    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!

    @IBAction func loginTapped() {
        authService.login(
            email: emailField.text ?? "",
            password: passwordField.text ?? ""
        ) { success in
            DispatchQueue.main.async {
                print(success ? "Zalogowano" : "Błąd logowania")
            }
        }
    }
}
