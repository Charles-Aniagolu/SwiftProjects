//
//  FavoritesView.swift
//  RestaurantApp
//
//  Created by Charles Nebo on 22.2.2025.
//

import SwiftUI

struct FavoriteView: View {
    @EnvironmentObject var viewModel: RestaurantViewModel

    var body: some View {
        NavigationView {
            if viewModel.favoriteRestaurants.isEmpty {
                VStack {
                    Text("No favorites yet!")
                        .font(.title2)
                        .foregroundColor(.gray)
                        .padding()
                }
                .navigationTitle("Favorites")
            } else {
                List(viewModel.favoriteRestaurants) { restaurant in
                    RestaurantRowView(restaurant: restaurant)
                }
                .navigationTitle("Favorites")
            }
        }
    }
}
