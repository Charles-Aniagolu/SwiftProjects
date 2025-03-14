//
//  ProfileView.swift
//  RestaurantApp
//
//  Created by Charles Nebo on 18.2.2025.
//

import SwiftUI

/*

struct ProfileView: View {
    @EnvironmentObject var authManager: AuthManager
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        VStack(alignment: .center, spacing: 15) {
            if let user = authManager.currentUser {
                Text("Name: \(user.name)")
                    .font(.title2)
                Text("Email: \(user.email)")
                    .font(.subheadline)
                    .foregroundColor(.gray)

                Button(action: logout) {
                    Text("Logout")
                        .bold()
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.red)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                .padding(.top, 10)
            } else {
                Text("No user logged in. Please log in again.")
                    .font(.title2)
                    .foregroundColor(.gray)
                    .padding()

                Button(action: goToLogin) {
                    Text("Go to Login")
                        .bold()
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                .padding(.top, 10)
            }
        }
        .padding()
        .navigationTitle("Profile")
        print("ProfileView.body - authManager.isAuthenticated: \(authManager.isAuthenticated)") //debug
    }

    private func logout() {
        authManager.logout()
        presentationMode.wrappedValue.dismiss()
    }

    private func goToLogin() {
        authManager.logout()
        presentationMode.wrappedValue.dismiss()
    }
}





struct ProfileView: View {
    @EnvironmentObject var authManager: AuthManager
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        VStack(alignment: .center, spacing: 15) {
            if let user = authManager.currentUser {
                Text("Name: \(user.name)")
                    .font(.title2)
                Text("Email: \(user.email)")
                    .font(.subheadline)
                    .foregroundColor(.gray)

                Button(action: logout) {
                    Text("Logout")
                        .bold()
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.red)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                .padding(.top, 10)
            } else {
                Text("No user logged in. Please log in again.")
                    .font(.title2)
                    .foregroundColor(.gray)
                    .padding()

                Button(action: goToLogin) {
                    Text("Go to Login")
                        .bold()
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                .padding(.top, 10)
            }
        }
        .padding()
        .navigationTitle("Profile")
        .onAppear { // Use onAppear to perform actions when the view appears
            print("ProfileView appeared - authManager.isAuthenticated: \(authManager.isAuthenticated)")
        }
    }

    private func logout() {
        authManager.logout()
        presentationMode.wrappedValue.dismiss()
    }

    private func goToLogin() {
        authManager.logout()
        presentationMode.wrappedValue.dismiss()
    }
}

*/


import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var authManager: AuthManager

    var body: some View {
        VStack {
            if authManager.isAuthenticated {
                Text("Welcome, \(authManager.currentUser?.name ?? "User")")
                    .font(.title)
                    .padding()

                Button(action: {
                    authManager.logout()
                }) {
                    Text("Logout")
                        .bold()
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.red)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding()
            } else {
                Text("You are not logged in")
                    .font(.title2)
                    .foregroundColor(.gray)
                    .padding()

                Button(action: {
                    authManager.isAuthenticated = false // Ensures UI changes
                }) {
                    Text("Go to Login")
                        .bold()
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding()
            }
        }
        .padding()
    }
}

