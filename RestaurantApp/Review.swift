//
//  Review.swift
//  RestaurantApp
//
//  Created by Charles Nebo on 18.2.2025.
//
// First - Define Models for the Restaurant app: Review Model
import Foundation

struct Review: Identifiable, Codable {
    var id = UUID()
    var userName: String
    var rating: Int
    var comment: String
    var date: Date
}

