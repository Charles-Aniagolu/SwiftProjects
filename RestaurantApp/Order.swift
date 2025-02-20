//
//  Order.swift
//  RestaurantApp
//
//  Created by Charles Nebo on 18.2.2025.
//


//First - Define Models for the Restaurant app: Order Model

import Foundation

struct Order: Identifiable {
    var id: UUID
    var userId: UUID
    var restaurantId: UUID
    var dishes: [Dish]
    var totalAmount: Double
    var orderDate: Date
    
}



