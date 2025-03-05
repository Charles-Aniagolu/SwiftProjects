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
    @StateObject var orderManager = OrderManager()
    @StateObject var userManager = UserManager()
    @StateObject var restaurantViewModel = RestaurantViewModel() // Single instance
    @StateObject var authManager = AuthManager()

    var body: some Scene {
        WindowGroup {
            if authManager.isAuthenticated {
                MainTabView()
                
                    .environmentObject(authManager) // inject authentication
                    .environmentObject(orderManager)
                    .environmentObject(userManager)
                    .environmentObject(restaurantViewModel) // Inject RestaurantViewModel globally
            }
            
        }
    }
}
