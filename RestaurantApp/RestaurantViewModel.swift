//
//  RestaurantViewModel.swift
//  RestaurantApp
//
//  Created by Charles Nebo on 18.2.2025.
//


// 2nd - Create ViewModels: RestaurantViewModel

import Foundation
import Combine

class RestaurantViewModel: ObservableObject {
    @Published var restaurants: [Restaurant] = []
    @Published var selectedCuisine: String? = nil // Holds the selected cuisine for filtering
    @Published var favorites: Set<UUID> = [] // Stores favorite restaurant IDs

    init() {
        fetchRestaurants()
    }

    func fetchRestaurants() {
        let sampleRestaurants: [Restaurant] = [
            Restaurant(
                id: UUID(),
                name: "La Trattoria",
                location: "123 Main Street, Helsinki",
                cuisine: "Italian",
                description: "A classic Italian restaurant serving traditional dishes and pasta.",
                rating: 4.5,
                menus: [
                    Menu(
                        id: UUID(),
                        name: "Appetizers",
                        dishes: [
                            Dish(
                                id: UUID(),
                                name: "Garlic Bread",
                                description: "Crispy bread with garlic butter",
                                ingredients: ["Flour", "Garlic Butter", "Parsley"],
                                price: 5.99,
                                imageName: "garlic_bread"
                            ),
                            Dish(
                                id: UUID(),
                                name: "Bruschetta",
                                description: "Toasted bread with tomatoes and basil",
                                ingredients: ["Bread", "Tomatoes", "Basil", "Olive Oil"],
                                price: 6.99,
                                imageName: "bruschetta"
                            )
                        ],
                        imageName: "appetizers"
                    )
                ],
                imageName: "la_trattoria"
            ),
            Restaurant(
                id: UUID(),
                name: "Sushi Haven",
                location: "45 Ocean Blvd, Espoo",
                cuisine: "Japanese",
                description: "Authentic Japanese sushi made from the freshest ingredients.",
                rating: 4.8,
                menus: [],
                imageName: "sushi_haven"
            ),
            Restaurant(
                id: UUID(),
                name: "Burger Bistro",
                location: "88 Grill St, Tampere",
                cuisine: "American",
                description: "Delicious gourmet burgers with fresh ingredients.",
                rating: 4.7,
                menus: [],
                imageName: "burger_bistro"
            ),
            Restaurant(
                id: UUID(),
                name: "Cafe Delight",
                location: "22 Baker St, Turku",
                cuisine: "Desserts & Beverages",
                description: "A cozy café with freshly brewed coffee and homemade pastries.",
                rating: 4.9,
                menus: [],
                imageName: "cafe_delight"
            )
        ]

        // Update the restaurant list safely on the main thread
        DispatchQueue.main.async {
            self.restaurants = sampleRestaurants
        }
    }

    // Get unique cuisine types dynamically
    var cuisineTypes: [String] {
        let allCuisines = restaurants.map { $0.cuisine }
        return Array(Set(allCuisines)).sorted() // Removes duplicates & sorts
    }

    // Filter restaurants based on the selected cuisine type
    var filteredRestaurants: [Restaurant] {
        if let selectedCuisine = selectedCuisine, !selectedCuisine.isEmpty {
            return restaurants.filter { $0.cuisine == selectedCuisine }
        }
        return restaurants // Show all restaurants if no filter is selected
    }
    
    // Toggle favorite function
    func toggleFavorite(_ restaurant: Restaurant) {
        if favorites.contains(restaurant.id) {
            favorites.remove(restaurant.id) // Unmark favorite
        } else {
            favorites.insert(restaurant.id) // Mark as favorite
        }
    }

    // Computed property to get only favorite restaurants
    var favoriteRestaurants: [Restaurant] {
        restaurants.filter { favorites.contains($0.id) }
    }
}
