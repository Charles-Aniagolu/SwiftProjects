//
//  RestaurantListView.swift
//  RestaurantApp
//
//  Created by Charles Nebo on 18.2.2025.
//

import SwiftUI

struct RestaurantListView: View {
    @EnvironmentObject var viewModel: RestaurantViewModel

    var body: some View {
        List {
            ForEach(viewModel.restaurants) { restaurant in
                HStack(spacing: 15) {
                    NavigationLink(destination: RestaurantDetailView(restaurant: restaurant)) {
                        restaurantImageView(for: restaurant)
                        restaurantInfoView(for: restaurant)
                    }
                    
                    Spacer()
                    
                    favoriteButton(for: restaurant) // Favorite Button
                }
                .padding(.vertical, 8)
            }
        }
        .navigationTitle("Restaurants")
    }

    private func restaurantImageView(for restaurant: Restaurant) -> some View {
        Group {
            if let uiImage = UIImage(named: restaurant.imageName) {
                Image(uiImage: uiImage)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
            } else {
                Image(systemName: "photo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
                    .foregroundColor(.gray)
            }
        }
    }

    private func restaurantInfoView(for restaurant: Restaurant) -> some View {
        VStack(alignment: .leading) {
            Text(restaurant.name)
                .font(.headline)
                .foregroundColor(.primary)
            Text(restaurant.cuisine)
                .font(.subheadline)
                .foregroundColor(.gray)
        }
    }

    private func favoriteButton(for restaurant: Restaurant) -> some View {
        Button(action: {
            viewModel.toggleFavorite(restaurant) // Save Favorite Status
        }) {
            Image(systemName: viewModel.favorites.contains(restaurant.id) ? "heart.fill" : "heart")
                .foregroundColor(.red)
        }
        .buttonStyle(BorderlessButtonStyle()) // Prevents unintended NavigationLink activation
    }
}

// MARK: - Preview
struct RestaurantListView_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantListView()
            .environmentObject(RestaurantViewModel())
    }
}

