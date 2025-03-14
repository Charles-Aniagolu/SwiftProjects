//
//  AuthManager.swift
//  RestaurantApp
//
//  Created by Charles Nebo on 5.3.2025.
//
/*
import SwiftUI


class AuthManager: ObservableObject {
    @Published var isAuthenticated: Bool = false // Track login state
    @Published var currentUser: User? // Store logged-in user details
    
    private let userKey = "savedUser"
    
    init() {
        self.currentUser = loadUserSession() // Load user from UserDefaults
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

    // Logout User
    func logout() {
        UserDefaults.standard.removeObject(forKey: userKey)
        DispatchQueue.main.async {
            self.isAuthenticated = false
            self.currentUser = nil
        }
    }

    // Update User Profile (Name, Email, Password)
    func updateUserProfile(name: String?, email: String?, password: String?) {
        guard var user = currentUser else { return }

        // Update fields if new values are provided
        if let newName = name, !newName.isEmpty { user.name = newName }
        if let newEmail = email, !newEmail.isEmpty { user.email = newEmail }
        if let newPassword = password, !newPassword.isEmpty { user.password = newPassword }

        saveUserSession(user: user)
    }

    // Save User Session to UserDefaults
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
*/


import SwiftUI

class AuthManager: ObservableObject {
    @Published var isAuthenticated: Bool = false // Track login state
    @Published var currentUser: User? // Store logged-in user details

    private let userKey = "savedUser"

    init() {
        self.currentUser = loadUserSession() // Load user from UserDefaults
        self.isAuthenticated = currentUser != nil // Update authentication state
        print("AuthManager initialized. isAuthenticated: \(isAuthenticated)") //debug
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
            print("AuthManager.login() successful. isAuthenticated: \(isAuthenticated)") //debug
            return true
        }
        print("AuthManager.login() failed. isAuthenticated: \(isAuthenticated)") //debug
        return false // Incorrect credentials
    }

    // Logout User
    func logout() {
        UserDefaults.standard.removeObject(forKey: userKey)
        DispatchQueue.main.async {
            self.isAuthenticated = false
            self.currentUser = nil
            print("AuthManager.logout() called. isAuthenticated: \(self.isAuthenticated)") //debug
        }
    }

    // Update User Profile (Name, Email, Password)
    func updateUserProfile(name: String?, email: String?, password: String?) {
        guard var user = currentUser else { return }

        // Update fields if new values are provided
        if let newName = name, !newName.isEmpty { user.name = newName }
        if let newEmail = email, !newEmail.isEmpty { user.email = newEmail }
        if let newPassword = password, !newPassword.isEmpty { user.password = newPassword }

        saveUserSession(user: user)
    }

    // Save User Session to UserDefaults
    private func saveUserSession(user: User) {
        if let encodedUser = try? JSONEncoder().encode(user) {
            UserDefaults.standard.set(encodedUser, forKey: userKey)
            DispatchQueue.main.async {
                self.isAuthenticated = true
                self.currentUser = user
                print("AuthManager.saveUserSession() called. isAuthenticated: \(self.isAuthenticated)")//debug
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


