//
//  RestaurantViewModel.swift
//  RestaurantApp
//
//  Created by Charles Nebo on 18.2.2025.
//


// 2nd - Create ViewModels: RestaurantViewModel

import Foundation
import Combine

// ViewModel
class RestaurantViewModel: ObservableObject {
    @Published var restaurants: [Restaurant] = []

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
                    ),
                    Menu(
                        id: UUID(),
                        name: "Desserts",
                        dishes: [
                            Dish(
                                id: UUID(),
                                name: "Chocolate Cake",
                                description: "Rich and moist chocolate cake",
                                ingredients: ["Flour", "Cocoa Powder", "Sugar", "Eggs", "Butter"],
                                price: 5.66,
                                imageName: "chocolate_cake"
                            )
                        ],
                        imageName: "desserts"
                    )
                ],
                imageName: "la_trattoria"
            ),
            Restaurant(
                id: UUID(),
                name: "Sushi Haven",
                location: "45 Ocean Blvd, Espoo",
                cuisine: "Japanese",
                description: "Fresh and authentic sushi with the finest ingredients.",
                rating: 6.2,
                menus: [
                    Menu(
                        id: UUID(),
                        name: "Sushi Rolls",
                        dishes: [
                            Dish(
                                id: UUID(),
                                name: "Spicy Tuna",
                                description: "Fresh tuna served on vinegared rice",
                                ingredients: ["Tuna", "Sushi Rice", "Soy Sauce", "Wasabi"],
                                price: 5.99,
                                imageName: "spicy_tuna"
                            ),
                            Dish(
                                id: UUID(),
                                name: "California Roll",
                                description: "Classic sushi roll with crab, avocado, and cucumber",
                                ingredients: ["Crab Meat", "Avocado", "Cucumber", "Nori", "Sushi Rice"],
                                price: 6.99,
                                imageName: "california_roll"
                            )
                        ],
                        imageName: "sushi_rolls"
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
                                price: 8.99,
                                imageName: "cheeseburger"
                            ),
                            Dish(
                                id: UUID(),
                                name: "Bacon Burger",
                                description: "Beef patty with crispy bacon and BBQ sauce",
                                ingredients: ["Beef Patty", "Bacon", "BBQ Sauce", "Burger Bun"],
                                price: 10.99,
                                imageName: "bacon_burger"
                            )
                        ],
                        imageName: "classic_burgers"
                    )
                ],
                imageName: "burger_bistro"
            ),
            Restaurant(
                id: UUID(),
                name: "Cafe Delight",
                location: "22 Baker St, Turku",
                cuisine: "Desserts & Beverages",
                description: "A cozy café with delicious pastries and beverages.",
                rating: 10.2,
                menus: [
                    Menu(
                        id: UUID(),
                        name: "Beverages",
                        dishes: [
                            Dish(
                                id: UUID(),
                                name: "Herbal Tea",
                                description: "Calming blend of chamomile and mint",
                                ingredients: ["Herbal Tea Leaves", "Water", "Honey", "Lemon"],
                                price: 3.50,
                                imageName: "herbal_tea"
                            ),
                            Dish(
                                id: UUID(),
                                name: "Cappuccino",
                                description: "Rich espresso with steamed milk and foam",
                                ingredients: ["Espresso", "Milk"],
                                price: 4.50,
                                imageName: "cappuccino"
                            )
                        ],
                        imageName: "beverages"
                    )
                ],
                imageName: "cafe_delight"
            )
        ]

        DispatchQueue.main.async {
            self.restaurants = sampleRestaurants
        }
    }
}
