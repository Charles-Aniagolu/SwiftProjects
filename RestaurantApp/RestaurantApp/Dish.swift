//
//  Dish.swift
//  RestaurantApp
//
//  Created by Charles Nebo on 18.2.2025.
//

// First - Define Models for the Restaurant app: Dish Model

import Foundation

struct Dish: Identifiable {
    let id: UUID
    let name: String
    let description: String
    let ingredients: [String]
    let price: Double
    let imageName: String
}
