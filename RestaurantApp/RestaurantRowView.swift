//
//  RestaurantRow.swift
//  RestaurantApp
//
//  Created by Charles Nebo on 19.2.2025.
//

import SwiftUI

struct RestaurantRowView: View {
    @EnvironmentObject var viewModel: RestaurantViewModel
    var restaurant: Restaurant

    var body: some View {
        HStack {
            Image(restaurant.imageName)
                .resizable()
                .scaledToFill()
                .frame(width: 60, height: 60)
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .clipped()

            VStack(alignment: .leading) {
                Text(restaurant.name)
                    .font(.headline)
                Text(restaurant.location)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }

            Spacer()

            // Favorite button should NOT trigger navigation
            Button(action: {
                viewModel.toggleFavorite(restaurant: restaurant)
            }) {
                Image(systemName: viewModel.favorites.contains(restaurant.id) ? "heart.fill" : "heart")
                    .foregroundColor(.red)
            }
            .buttonStyle(BorderlessButtonStyle()) // Prevents row tap interference
        }
        .padding()
        .background(
            NavigationLink(destination: RestaurantDetailView(restaurant: restaurant)) {
                EmptyView()
            }
            .opacity(0) // Makes it invisible
        )
        .contentShape(Rectangle()) // Ensures only row taps trigger navigation
    }
}
