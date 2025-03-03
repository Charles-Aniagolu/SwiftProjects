//
//  FavoriteManager.swift
//  RestaurantApp
//
//  Created by Charles Nebo on 25.2.2025.
//

import SwiftUI

class FavoritesManager {
    static let shared = FavoritesManager()
    private let favoritesKey = "favoriteRestaurants"
    
    // Save favorites using UUIDs
    func saveFavorites(_ favorites: Set<UUID>) {
        let favoriteIDs = favorites.map { $0.uuidString }
        UserDefaults.standard.set(favoriteIDs, forKey: favoritesKey)
    }

    // Retrieve favorites as UUIDs
    func getFavorites() -> Set<UUID> {
        let favoriteIDs = UserDefaults.standard.array(forKey: favoritesKey) as? [String] ?? []
        return Set(favoriteIDs.compactMap { UUID(uuidString: $0) })
    }

    // Add a new favorite
    func addFavorite(_ id: UUID) {
        var favorites = getFavorites()
        if !favorites.contains(id) {
            favorites.insert(id)
            saveFavorites(favorites)
        }
    }

    // Remove a favorite
    func removeFavorite(_ id: UUID) {
        var favorites = getFavorites()
        favorites.remove(id)
        saveFavorites(favorites)
    }

    // Check if a restaurant is favorite
    func isFavorite(_ id: UUID) -> Bool {
        return getFavorites().contains(id)
    }
}


