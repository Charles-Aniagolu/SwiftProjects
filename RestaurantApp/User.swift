//
//  User.swift
//  RestaurantApp
//
//  Created by Charles Nebo on 18.2.2025.
//

// First - Define Models for the Restaurant app: User Model
import Foundation

struct User: Identifiable, Codable, Equatable {
    var id: UUID = UUID()
    var name: String
    var email: String
    var password: String
    var phone: String?
    var preferences: [String] = [] // Default value to avoid missing argument error
    var orderHistoryIDs: [UUID] = []
    var bio: String?
    var joinedDate: Date = Date()

    // Conform to Equatable
    static func == (lhs: User, rhs: User) -> Bool {
        return lhs.id == rhs.id
    }
}
