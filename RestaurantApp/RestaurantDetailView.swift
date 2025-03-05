//
//  RestaurantDetailView.swift
//  RestaurantApp
//
//  Created by Charles Nebo on 18.2.2025.
//

import SwiftUI

struct RestaurantDetailView: View {
    let restaurant: Restaurant
    @EnvironmentObject var orderManager: OrderManager
    @State private var showConfirmation = false // ✅ State variable for confirmation message
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 15) {
                restaurantImageView()
                restaurantInfoView()
                restaurantDescriptionView()
                Divider().padding(.vertical, 10)
                menuListView()
            }
            .padding(.bottom, 20)
        }
        .navigationTitle("Restaurant Details")
        .navigationBarTitleDisplayMode(.inline)
        .alert(isPresented: $showConfirmation) { // ✅ Show alert when item is added
            Alert(title: Text("Added to Order"), message: Text("Your dish has been added successfully."), dismissButton: .default(Text("OK")))
        }
    }
    
    // MARK: - Components
    private func restaurantImageView() -> some View {
        ZStack(alignment: .center) {
            Rectangle()
                .fill(Color(.systemGray6))
                .frame(width: UIScreen.main.bounds.width - 30, height: 250)
                .cornerRadius(12)
                .shadow(color: Color.black.opacity(0.15), radius: 5, x: 0, y: 3)
                .padding(.horizontal, 15)
            
            Image(restaurant.imageName)
                .resizable()
                .scaledToFill()
                .frame(width: UIScreen.main.bounds.width - 30, height: 250)
                .clipShape(RoundedRectangle(cornerRadius: 12))
                .clipped()
                .padding(.horizontal, 15)
                .onAppear {
                    if UIImage(named: restaurant.imageName) == nil {
                        print("⚠️ Image \(restaurant.imageName) not found!")
                    }
                }
        }
        .padding(.top, 10)
    }
    
    private func restaurantInfoView() -> some View {
        VStack(alignment: .leading) {
            Text(restaurant.name)
                .font(.largeTitle)
                .bold()
                .padding(.horizontal)
            Text(restaurant.cuisine)
                .font(.title2)
                .foregroundColor(.gray)
                .padding(.horizontal)
            HStack {
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
                Text("\(restaurant.rating, specifier: "%.1f")")
                    .font(.headline)
            }
            .padding(.horizontal)
        }
    }
    
    private func restaurantDescriptionView() -> some View {
        Text(restaurant.description)
            .font(.body)
            .padding(.horizontal)
    }
    
    private func menuListView() -> some View {
        VStack(alignment: .leading, spacing: 10) {
            ForEach(restaurant.menus) { menu in
                VStack(alignment: .leading, spacing: 5) {
                    Text(menu.name)
                        .font(.title3)
                        .bold()
                        .padding(.horizontal)
                    ForEach(menu.dishes) { dish in
                        dishRowView(dish: dish)
                    }
                }
            }
        }
    }
    
    private func dishRowView(dish: Dish) -> some View {
        HStack {
            VStack(alignment: .leading) {
                Text(dish.name)
                    .font(.body)
                    .bold()
                Text(dish.description)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            .padding(.horizontal)
            Spacer()
            VStack {
                Text("€\(dish.price, specifier: "%.2f")")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                Button(action: {
                    orderManager.addToOrder(dish: dish, restaurant: restaurant)
                    showConfirmation = true
                    
                    // ✅ Haptic Feedback when adding an order
                    UIImpactFeedbackGenerator(style: .medium).impactOccurred()
                    
                }) {
                    Text("Add to Order")
                        .font(.caption)
                        .padding(6)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
            }
        }
        .padding(.vertical, 5)
    }
}
