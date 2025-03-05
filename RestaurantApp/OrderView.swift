//
//  OrderView.swift
//  RestaurantApp
//
//  Created by Charles Nebo on 18.2.2025.
//

import SwiftUI

struct OrderView: View {
    @EnvironmentObject var orderManager: OrderManager // ✅ Correctly references the shared OrderManager

    var body: some View {
        NavigationView {
            VStack {
                if orderManager.orders.isEmpty {
                    Text("No orders placed yet.")
                        .font(.title3)
                        .foregroundColor(.gray)
                        .padding()
                } else {
                    List {
                        ForEach(orderManager.orders) { order in
                            HStack {
                                VStack(alignment: .leading) {
                                    Text(order.dish.name)
                                        .font(.headline)
                                    Text("From: \(order.restaurant.name)")
                                        .font(.subheadline)
                                        .foregroundColor(.gray)
                                    Text("Quantity: \(order.quantity)")
                                        .font(.subheadline)
                                }
                                Spacer()
                                Text("€\(order.totalPrice, specifier: "%.2f")")
                                    .font(.headline)
                                    .foregroundColor(.blue)
                            }
                        }
                        .onDelete(perform: deleteOrder)
                    }
                }
            }
            .navigationTitle("Your Orders")
        }
    }

    private func deleteOrder(at offsets: IndexSet) {
        offsets.forEach { index in
            let order = orderManager.orders[index]
            orderManager.removeFromOrder(order: order) // ✅ Correctly uses removeFromOrder function
        }
    }
}
