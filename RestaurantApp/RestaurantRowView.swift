//
//  RestaurantRow.swift
//  RestaurantApp
//
//  Created by Charles Nebo on 19.2.2025.
//

import SwiftUI

struct RestaurantRowView: View {
    let restaurant: Restaurant
    @EnvironmentObject var restaurantViewModel: RestaurantViewModel

    var body: some View {
        HStack {
            //  Restaurant Image (With Placeholder If Missing)
            if let uiImage = UIImage(named: restaurant.imageName) {
                Image(uiImage: uiImage)
                    .resizable()
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
            } else {
                Image(systemName: "photo") // Fallback placeholder
                    .resizable()
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
                    .foregroundColor(.gray)
            }

            // Restaurant Name & Cuisine
            VStack(alignment: .leading) {
                Text(restaurant.name)
                    .font(.headline)
                Text(restaurant.cuisine)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }

            Spacer() // Push Heart Button to the Right

            //  Heart Button for Favorites
            Button(action: {
                restaurantViewModel.toggleFavorite(restaurant)
            }) {
                Image(systemName: restaurantViewModel.favorites.contains(restaurant.id) ? "heart.fill" : "heart")
                    .foregroundColor(restaurantViewModel.favorites.contains(restaurant.id) ? .red : .gray)
            }
            .buttonStyle(PlainButtonStyle()) // Prevents extra button styling
        }
    }
}
