//
//  Menu.swift
//  RestaurantApp
//
//  Created by Charles Nebo on 18.2.2025.
//


// First - Define Models for the Restaurant app: Menu Model

import Foundation


struct Menu: Identifiable {
    let id: UUID
    let name: String
    let dishes: [Dish]
    let imageName: String
}
