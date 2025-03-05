//
//  RestaurantViewModel.swift
//  RestaurantApp
//
//  Created by Charles Nebo on 18.2.2025.
//


// 2nd - Create ViewModels: RestaurantViewModel

//
//  RestaurantViewModel.swift
//  RestaurantApp
//
//  Created by Charles Nebo on 18.2.2025.
//

import Combine
import SwiftUI

class RestaurantViewModel: ObservableObject {
    @Published var restaurants: [Restaurant] = []
    @Published var selectedCuisine: String? = nil
    @Published var favorites: Set<UUID> = [] {
        didSet {
            saveFavorites()
        }
    }
    
    private let favoritesKey = "favoriteRestaurants"
    
    init() {
        print("🔄 Initializing RestaurantViewModel")
        loadFavorites()  // ✅ Load favorites before fetching restaurants
        fetchRestaurants()  // ✅ Then load restaurants
    }
    
    
    func fetchRestaurants() {
        let sampleRestaurants: [Restaurant] = [
            Restaurant(
                id: UUID(),
                name: "La Trattoria",
                location: "123 Main Street, Helsinki",
                cuisine: "Italian",
                description: "Crispy bread with garlic butter",
                rating: 4.5,
                menus: [
                    Menu(
                        name: "Appetizers",
                        dishes: [
                            Dish(
                                name: "Garlic Bread",
                                description: "Crispy bread with garlic butter",
                                ingredients: ["Flour", "Garlic Butter", "Parsley"],
                                imageName: "garlic_bread",
                                price: 12.99
                            ),
                            Dish(
                                name: "Bruschetta",
                                description: "Toasted bread with tomatoes and basil",
                                ingredients: ["Bread", "Tomatoes", "Basil", "Olive Oil"],
                                imageName: "bruschetta",
                                price: 14.99
                            )
                        ]
                    ),
                    Menu(
                        name: "Pasta",
                        dishes: [
                            Dish(
                                name: "Spaghetti Carbonara",
                                description: "Creamy pasta with bacon and egg",
                                ingredients: ["Spaghetti", "Egg", "Bacon", "Parmesan"],
                                imageName: "spaghetti_carbonara",
                                price: 15.99
                            ),
                            Dish(
                                name: "Lasagna",
                                description: "Layered pasta with meat sauce and cheese",
                                ingredients: ["Lasagna Noodles", "Ground Beef", "Tomato Sauce", "Cheese"],
                                imageName: "lasagna",
                                price: 15.99
                            )
                        ]
                    )
                ],
                imageName: "la_trattoria"
            ),
            
            
            
            Restaurant(
                id: UUID(),
                name: "Sushi Haven",
                location: "45 Ocean Blvd, Espoo",
                cuisine: "Japanese",
                description: "Crab, avocado, cucumber, and sesame seeds",
                rating: 6.2,
                menus: [
                    Menu(
                        name: "Sushi Rolls",
                        dishes: [
                            Dish(
                                name: "Salmon Nigiri",
                                description: "Fresh salmon served on vinegared rice",
                                ingredients: ["Salmon", "Sushi Rice", "Soy Sauce", "Wasabi"],
                                imageName: "salmon_nigiri",
                                price: 5.99
                            ),
                            Dish(
                                name: "California Roll",
                                description: "Classic sushi roll with crab, avocado, and cucumber",
                                ingredients: ["Crab Meat", "Avocado", "Cucumber", "Nori", "Sushi Rice"],
                                imageName: "california_roll",
                                price: 6.99
                                
                            )
                        ]
                    ),
                    Menu(
                        name: "Appetizers",
                        dishes: [
                            Dish(
                                name: "Miso Soup",
                                description: "Traditional Japanese soup with tofu and seaweed",
                                ingredients: ["Miso Paste", "Dashi Stock", "Tofu", "Seaweed", "Green Onions"],
                                imageName: "miso_soup",
                                price: 12.99
                            ),
                            Dish(
                                name: "Edamame",
                                description: "Steamed soybeans with sea salt",
                                ingredients: ["Edamame", "Sea Salt"],
                                imageName: "edamame",
                                price: 18.99
                            )
                        ]
                    )
                ],
                imageName: "sushi_haven"
            ),
            
            
            Restaurant(
                id: UUID(),
                name: "Burger Bistro",
                location: "88 Grill St, Tampere",
                cuisine: "American",
                description: "Sweet tasting Burger Bistro",
                rating: 8.5,
                menus: [
                    Menu(
                        id: UUID(),
                        name: "Classic Burgers",
                        dishes: [
                            Dish(
                                id: UUID(),
                                name: "Cheeseburger",
                                description: "Juicy beef patty with melted cheese",
                                ingredients: ["Beef Patty", "Cheese", "Lettuce", "Tomato", "Burger Bun"],
                                imageName: "cheeseburger",
                                price: 8.99
                            )
                        ]
                    )
                ],
                imageName: "burger_bistro"
            ),
            Restaurant(
                id: UUID(),
                name: "Cafe Delight",
                location: "22 Baker St, Turku",
                cuisine: "Desserts & Beverages",
                description: "A cozy café with freshly brewed coffee and homemade pastries.",
                rating: 9.2,
                menus: [
                    Menu(
                        id: UUID(),
                        name: "Desserts",
                        dishes: [
                            Dish(
                                id: UUID(),
                                name: "Chocolate Cake",
                                description: "Rich and moist chocolate cake",
                                ingredients: ["Flour", "Cocoa Powder", "Sugar", "Eggs", "Butter"],
                                imageName: "chocolate_cake",
                                price: 4.99
                            )
                        ]
                    )
                ],
                imageName: "cafe_delight"
            )
        ]
        
        DispatchQueue.main.async {
                   self.restaurants = sampleRestaurants
                   self.loadFavorites() // Load favorites AFTER restaurants are available
               }
           }

           var favoriteRestaurants: [Restaurant] {
               restaurants.filter { favorites.contains($0.id) }
           }

           // Save Favorites to UserDefaults
           private func saveFavorites() {
               let favoriteIDs = favorites.map { $0.uuidString }
               UserDefaults.standard.set(favoriteIDs, forKey: favoritesKey)
               UserDefaults.standard.synchronize() // Ensures immediate save
           }

           // Load Favorites from UserDefaults AFTER restaurants are loaded
           private func loadFavorites() {
               DispatchQueue.global(qos: .background).async {
                   if let favoriteIDs = UserDefaults.standard.array(forKey: self.favoritesKey) as? [String] {
                       let uuidFavorites = Set(favoriteIDs.compactMap { UUID(uuidString: $0) })

                       DispatchQueue.main.async {
                           self.favorites = uuidFavorites
                       }
                   }
               }
           }

           // Toggle Favorite Restaurant
           func toggleFavorite(_ restaurant: Restaurant) {
               if favorites.contains(restaurant.id) {
                   favorites.remove(restaurant.id)
               } else {
                   favorites.insert(restaurant.id)
               }
               saveFavorites() // Ensure favorites persist after toggle
           }
       }
