//
//  RestaurantListView.swift
//  RestaurantApp
//
//  Created by Charles Nebo on 18.2.2025.
//

import SwiftUI





struct RestaurantListView: View {
    @StateObject private var viewModel = RestaurantViewModel()

    var body: some View {
        NavigationView {
            List(viewModel.restaurants) { restaurant in
                NavigationLink(destination: RestaurantDetailView(restaurant: restaurant)) {
                    RestaurantRowView(restaurant: restaurant)
                }
            }
            .navigationTitle("Restaurants")
        }
    }
}
 
 







