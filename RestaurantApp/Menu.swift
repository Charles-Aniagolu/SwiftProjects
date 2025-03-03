//
//  Menu.swift
//  RestaurantApp
//
//  Created by Charles Nebo on 18.2.2025.
//


// First - Define Models for the Restaurant app: Menu Model

import Foundation

struct Menu: Identifiable, Codable {
    var id: UUID = UUID()
    var name: String
    var dishes: [Dish]
}
