//
//  AuthView.swift
//  RestaurantApp
//
//  Created by Charles Nebo on 5.3.2025.
//

import SwiftUI

struct AuthView: View {
    @EnvironmentObject var authManager: AuthManager
    @State private var email = ""
    @State private var password = ""
    @State private var name = ""
    @State private var isRegistering = false
    @State private var errorMessage = ""

    var body: some View {
        VStack {
            Text(isRegistering ? "Register" : "Login")
                .font(.largeTitle)
                .bold()

            if isRegistering {
                TextField("Name", text: $name)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
            }

            TextField("Email", text: $email)
                .keyboardType(.emailAddress)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            SecureField("Password", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            if !errorMessage.isEmpty {
                Text(errorMessage)
                    .foregroundColor(.red)
                    .padding()
            }

            Button(action: {
                if isRegistering {
                    if authManager.register(email: email, password: password, name: name) {
                        errorMessage = ""
                    } else {
                        errorMessage = "Invalid registration details"
                    }
                } else {
                    if authManager.login(email: email, password: password) {
                        errorMessage = ""
                    } else {
                        errorMessage = "Invalid email or password"
                    }
                }
            }) {
                Text(isRegistering ? "Register" : "Login")
                    .bold()
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding()

            Button(action: {
                isRegistering.toggle()
                errorMessage = ""
            }) {
                Text(isRegistering ? "Already have an account? Login" : "No account? Register")
                    .foregroundColor(.blue)
            }
        }
        .padding()
    }
}
