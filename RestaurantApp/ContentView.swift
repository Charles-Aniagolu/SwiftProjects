//
//  ContentView.swift
//  RestaurantApp
//
//  Created by Charles Nebo on 6.3.2025.
//

//import SwiftUI


/*
struct ContentView: View {
    @StateObject var authManager = AuthManager()

    var body: some View {
        NavigationView {
            VStack{
                if authManager.isAuthenticated {
                    ProfileView()
                } else {
                    Text("Login View Placeholder") // Replace with your actual LoginView
                }
            }
            .environmentObject(authManager)
        }
    }
}

*/




import SwiftUI

struct ContentView: View {
    @StateObject var authManager = AuthManager()

    var body: some View {
        Group {
            if authManager.isAuthenticated {
                NavigationView {
                    MainTabView()
                }
            } else {
                NavigationView {
                    AuthView() // Show actual AuthView instead of a placeholder
                }
            }
        }
        .environmentObject(authManager)
        .onAppear {
            print("ContentView appeared - authManager.isAuthenticated: \(authManager.isAuthenticated)")
        }
    }
}
