//
//  RestaurantAppApp.swift
//  RestaurantApp
//
//  Created by Charles Nebo on 18.2.2025.
//

// Setup Main Navigation: RestaurantApp

import SwiftUI

@main
struct RestaurantApp: App {
    @StateObject var authManager = AuthManager()
    @StateObject var orderManager = OrderManager()
    @StateObject var restaurantViewModel = RestaurantViewModel()

    var body: some Scene {
        WindowGroup {
            if authManager.isAuthenticated {
                MainTabView()
                    .environmentObject(authManager)
                    .environmentObject(orderManager)
                    .environmentObject(restaurantViewModel)
            } else {
                AuthView()
                    .environmentObject(authManager)
            }
        }
    }
}
