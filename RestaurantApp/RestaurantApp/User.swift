//
//  User.swift
//  RestaurantApp
//
//  Created by Charles Nebo on 18.2.2025.
//

// First - Define Models for the Restaurant app: User Model

import Foundation

struct User: Identifiable, Codable {
    var id: UUID
    var name: String
    var email: String
    var phoneNumber: String?
    var address: String?
}

