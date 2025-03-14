//
//  OrderManager.swift
//  RestaurantApp
//
//  Created by Charles Nebo on 18.2.2025.
//


//  2nd - Create ViewModels: OrderManager


import SwiftUI

class OrderManager: ObservableObject {
    @Published var orders: [Order] = []
    private let ordersKey = "savedOrders"

    init() {
        loadOrders()
    }

    func addToOrder(dish: Dish, restaurant: Restaurant) {
        let newOrder = Order(dish: dish, restaurant: restaurant, quantity: 1, orderDate: Date())
        orders.append(newOrder)
        saveOrders()
    }

    func removeFromOrder(order: Order) {
        orders.removeAll { $0.id == order.id }
        saveOrders()
    }

    func clearOrders() {
        orders.removeAll()
        saveOrders() // Ensure persistence after clearing
    }

    func saveOrders() {
        if let encodedOrders = try? JSONEncoder().encode(orders) {
            UserDefaults.standard.set(encodedOrders, forKey: ordersKey)
            DispatchQueue.main.async {
                self.objectWillChange.send() // Trigger UI updates
            }
        }
    }

    private func loadOrders() {
        if let savedOrders = UserDefaults.standard.data(forKey: ordersKey),
           let decodedOrders = try? JSONDecoder().decode([Order].self, from: savedOrders) {
            DispatchQueue.main.async {
                self.orders = decodedOrders
            }
        }
    }
}
