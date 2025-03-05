//
//  ProfileView.swift
//  RestaurantApp
//
//  Created by Charles Nebo on 18.2.2025.
//

import SwiftUI

struct ProfileView: View {
    @State private var user = User(name: "John Doe", email: "john@example.com", preferences: ["Vegan"])

    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 10) {
                Text("Name: \(user.name)")
                    .font(.title2)
                Text("Email: \(user.email)")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                Text("Preferences: \(user.preferences.joined(separator: ", "))")
                    .font(.subheadline)

                Spacer()
            }
            .padding()
            .navigationTitle("Profile")
        }
    }
}

