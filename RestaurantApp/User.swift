//
//  User.swift
//  RestaurantApp
//
//  Created by Charles Nebo on 18.2.2025.
//

// First - Define Models for the Restaurant app: User Model
import Foundation

struct User: Identifiable {
    var id: UUID = UUID()
    var name: String
    var email: String
    var phone: String?
    var preferences: [String]
    var orderHistoryIDs: [UUID] = []
    var bio: String?
    var joinedDate: Date = Date()
}
