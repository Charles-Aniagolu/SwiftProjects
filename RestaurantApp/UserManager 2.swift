//
//  UserManager 2.swift
//  RestaurantApp
//
//  Created by Charles Nebo on 27.2.2025.
//


import SwiftUI

class UserManager: ObservableObject {
    @Published var currentUser: User?
    private let userKey = "savedUser" // Key for storing user data in UserDefaults

    init() {
        loadUser()
    }

    func saveUser(user: User) {
        if let encodedUser = try? JSONEncoder().encode(user) {
            UserDefaults.standard.set(encodedUser, forKey: userKey)
            self.currentUser = user
        }
    }

    func loadUser() {
        if let savedUser = UserDefaults.standard.data(forKey: userKey),
           let decodedUser = try? JSONDecoder().decode(User.self, from: savedUser) {
            DispatchQueue.main.async {
                self.currentUser = decodedUser
            }
        }
    }

    func clearUser() {
        UserDefaults.standard.removeObject(forKey: userKey)
        DispatchQueue.main.async {
            self.currentUser = nil
        }
    }
}
