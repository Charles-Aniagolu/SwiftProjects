//
//  Restaurant.swift
//  RestaurantApp
//
//  Created by Charles Nebo on 18.2.2025.
//

// First - Define Models for the Restaurant app: Restaurant Model


import Foundation

struct Restaurant: Identifiable {
    var id: UUID
    var name: String
    var location: String
    var cuisine: String
    var description: String
    var rating: Double
    var menus: [Menu]
    var imageName: String
}
