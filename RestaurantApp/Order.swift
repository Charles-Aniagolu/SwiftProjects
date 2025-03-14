//
//  Order.swift
//  RestaurantApp
//
//  Created by Charles Nebo on 18.2.2025.
//


//First - Define Models for the Restaurant app: Order Model
import Foundation

struct Order: Identifiable, Codable {
    var id: UUID = UUID()
    let dish: Dish
    let restaurant: Restaurant
    var quantity: Int
    let orderDate: Date

    var totalPrice: Double {
        return dish.price * Double(quantity)
    }
}



