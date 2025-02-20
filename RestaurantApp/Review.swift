//
//  Review.swift
//  RestaurantApp
//
//  Created by Charles Nebo on 18.2.2025.
//
// First - Define Models for the Restaurant app: Review Model

import Foundation

struct Review: Identifiable, Codable {
    var id: UUID
    var userId: UUID
    var restaurantId: UUID
    var rating: Int // Typically 1 to 5
    var comment: String
    var date: Date
}

