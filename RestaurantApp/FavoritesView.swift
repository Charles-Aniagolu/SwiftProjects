//
//  FavoritesView.swift
//  RestaurantApp
//
//  Created by Charles Nebo on 22.2.2025.
//

import SwiftUI

struct FavoritesView: View {
    @ObservedObject var viewModel: RestaurantViewModel // Uses the shared instance

    var body: some View {
        NavigationView {
            VStack {
                if viewModel.favoriteRestaurants.isEmpty {
                    Text("No favorites yet!")
                        .font(.headline)
                        .foregroundColor(.gray)
                        .padding()
                } else {
                    List(viewModel.favoriteRestaurants) { restaurant in
                        NavigationLink(destination: RestaurantDetailView(restaurant: restaurant)) {
                            HStack {
                                // Properly loads images
                                Image(restaurant.imageName)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 50, height: 50)
                                    .clipShape(Circle())
                                    .overlay(Circle().stroke(Color.gray, lineWidth: 1))
                                    .shadow(radius: 2)

                                VStack(alignment: .leading) {
                                    Text(restaurant.name)
                                        .font(.headline)
                                    Text(restaurant.cuisine)
                                        .font(.subheadline)
                                        .foregroundColor(.gray)
                                }
                            }
                        }
                    }
                }
            }
            .navigationTitle("Favorites")
        }
    }
}
