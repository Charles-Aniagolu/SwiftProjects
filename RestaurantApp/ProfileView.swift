//
//  ProfileView.swift
//  RestaurantApp
//
//  Created by Charles Nebo on 18.2.2025.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var authManager: AuthManager // Access authentication state

    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 15) {
                if let user = authManager.currentUser {
                    Text("Name: \(user.name)")
                        .font(.title2)
                    Text("Email: \(user.email)")
                        .font(.subheadline)
                        .foregroundColor(.gray)

                    Spacer()

                    Button(action: {
                        authManager.logout() // Logout action
                    }) {
                        Text("Logout")
                            .bold()
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.red)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                } else {
                    Text("No user logged in")
                        .font(.title2)
                        .foregroundColor(.gray)
                }
            }
            .padding()
            .navigationTitle("Profile")
        }
    }
}

