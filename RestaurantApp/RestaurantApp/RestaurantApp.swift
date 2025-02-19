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
    var body: some Scene {
        WindowGroup {
            MainTabView()
                .environmentObject(RestaurantViewModel()) // Inject the ViewModel
        }
    }
}
