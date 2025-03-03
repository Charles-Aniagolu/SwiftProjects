//
//  Dish.swift
//  RestaurantApp
//
//  Created by Charles Nebo on 18.2.2025.
//

// First - Define Models for the Restaurant app: Dish Model
import Foundation

struct Dish: Identifiable, Codable {
    var id: UUID = UUID()
    var name: String
    var description: String
    var ingredients: [String]
    var imageName: String
    var price: Double
}

