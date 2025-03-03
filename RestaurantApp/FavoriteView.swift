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
            List(viewModel.favoriteRestaurants) { restaurant in
                RestaurantRowView(restaurant: restaurant)
            }
            .navigationTitle("Favorites")
        }
    }
}
