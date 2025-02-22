//
//  RestaurantListView.swift
//  RestaurantApp
//
//  Created by Charles Nebo on 18.2.2025.
//

import SwiftUI


struct RestaurantListView: View {
    @StateObject var viewModel = RestaurantViewModel() // Observes data updates

    var body: some View {
        NavigationView {
            VStack {
                // Picker for Cuisine Filtering
                Picker("Filter by Cuisine", selection: $viewModel.selectedCuisine) {
                    Text("All").tag(nil as String?)
                    ForEach(viewModel.cuisineTypes, id: \.self) { cuisine in
                        Text(cuisine).tag(cuisine as String?)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()

                // List of Restaurants (Filtered)
                List(viewModel.filteredRestaurants) { restaurant in
                    HStack {
                        NavigationLink(destination: RestaurantDetailView(restaurant: restaurant)) {
                            HStack {
                                // Circular Image for Restaurants
                                Image(restaurant.imageName)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 50, height: 50)
                                    .clipShape(Circle()) // Makes it a circle
                                    .overlay(Circle().stroke(Color.gray, lineWidth: 1)) // Optional border
                                    .shadow(radius: 2) // Adds subtle shadow

                                VStack(alignment: .leading) {
                                    Text(restaurant.name)
                                        .font(.headline)
                                    Text(restaurant.cuisine)
                                        .font(.subheadline)
                                        .foregroundColor(.gray)
                                }
                            }
                        }
                        Spacer()

                        // Favorite Button
                        Button(action: {
                            viewModel.toggleFavorite(restaurant)
                        }) {
                            Image(systemName: viewModel.favorites.contains(restaurant.id) ? "heart.fill" : "heart")
                                .foregroundColor(viewModel.favorites.contains(restaurant.id) ? .red : .gray)
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                }
            }
            .navigationTitle("Restaurants")
        }
    }
}


 







