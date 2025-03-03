//
//  RestaurantDetailView.swift
//  RestaurantApp
//
//  Created by Charles Nebo on 18.2.2025.
//

import SwiftUI

struct RestaurantDetailView: View {
    let restaurant: Restaurant
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 15) {
                // Restaurant Image with Background
                ZStack(alignment: .center) { // ✅ Ensures image is centered
                    Rectangle()
                        .fill(Color(.systemGray6)) // Light background contrast
                        .frame(width: UIScreen.main.bounds.width - 30, height: 250)
                        .cornerRadius(12)
                        .shadow(color: Color.black.opacity(0.15), radius: 5, x: 0, y: 3)
                        .padding(.horizontal, 15) // ✅ Keeps rectangle centered

                    Image(restaurant.imageName)
                        .resizable()
                        .scaledToFill()
                        .frame(width: UIScreen.main.bounds.width - 30, height: 250)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                        .clipped()
                        .padding(.horizontal, 15) // ✅ Ensures image is centered properly
                }
                .padding(.top, 10)
                
                // Restaurant Name & Info
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
                
                // Restaurant Description
                Text(restaurant.description)
                    .font(.body)
                    .padding(.horizontal)
                
                Divider()
                    .padding(.vertical, 10)
                
                // Menu Section
                ForEach(restaurant.menus) { menu in
                    VStack(alignment: .leading, spacing: 5) {
                        Text(menu.name)
                            .font(.title3)
                            .bold()
                            .padding(.horizontal)
                        
                        ForEach(menu.dishes) { dish in
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
                                Text("€\(dish.price, specifier: "%.2f")")
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                                    .padding(.trailing)
                            }
                            .padding(.vertical, 5)
                        }
                    }
                }
            }
            .padding(.bottom, 20)
        }
        .navigationTitle("Restaurant Details")
        .navigationBarTitleDisplayMode(.inline)
    }
}

// Preview
struct RestaurantDetailView_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantDetailView(restaurant: Restaurant(
            id: UUID(),
            name: "La Trattoria",
            location: "123 Main Street, Helsinki",
            cuisine: "Italian",
            description: "A classic Italian restaurant serving traditional dishes and pasta.",
            rating: 4.5,
            menus: [
                Menu(id: UUID(), name: "Appetizers", dishes: [
                    Dish(id: UUID(), name: "Bruschetta", description: "Toasted bread with tomatoes and basil", ingredients: ["Bread", "Tomatoes", "Basil", "Olive Oil"], imageName: "bruschetta", price: 4.99)
                ])
            ],
            imageName: "la_trattoria"
        ))
    }
}
