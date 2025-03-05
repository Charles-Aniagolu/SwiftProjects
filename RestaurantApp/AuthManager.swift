//
//  AuthManager.swift
//  RestaurantApp
//
//  Created by Charles Nebo on 5.3.2025.
//

import SwiftUI

class AuthManager: ObservableObject {
    @Published var isAuthenticated: Bool = false // Track login state
    @Published var currentUser: User? // Store logged-in user details
    
    private let userKey = "savedUser"
    
    init() {
            self.currentUser = loadUserSession() // Assign result to currentUser
            self.isAuthenticated = currentUser != nil // Update authentication state
        }

    // Register a New User
    func register(email: String, password: String, name: String) -> Bool {
        guard !email.isEmpty, !password.isEmpty, !name.isEmpty else {
            return false // Validation: Fields cannot be empty
        }
        
        let newUser = User(name: name, email: email, password: password)
        saveUserSession(user: newUser)
        return true
    }

    // Login User
    func login(email: String, password: String) -> Bool {
        if let savedUser = loadUserSession(), savedUser.email == email, savedUser.password == password {
            self.isAuthenticated = true
            self.currentUser = savedUser
            return true
        }
        return false // Incorrect credentials
    }

    //  Logout User
    func logout() {
        UserDefaults.standard.removeObject(forKey: userKey)
        DispatchQueue.main.async {
            self.isAuthenticated = false
            self.currentUser = nil
        }
    }
    
    // Save User Session
    private func saveUserSession(user: User) {
        if let encodedUser = try? JSONEncoder().encode(user) {
            UserDefaults.standard.set(encodedUser, forKey: userKey)
            DispatchQueue.main.async {
                self.isAuthenticated = true
                self.currentUser = user
            }
        }
    }
    
    // Load User Session from UserDefaults
     private func loadUserSession() -> User? {
         if let savedUserData = UserDefaults.standard.data(forKey: userKey),
            let decodedUser = try? JSONDecoder().decode(User.self, from: savedUserData) {
             return decodedUser
         }
         return nil
     }
 }
