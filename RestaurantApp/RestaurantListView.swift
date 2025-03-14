//
//  RestaurantListView.swift
//  RestaurantApp
//
//  Created by Charles Nebo on 18.2.2025.
//

import SwiftUI

struct RestaurantListView: View {
    @EnvironmentObject var restaurantViewModel: RestaurantViewModel

    var body: some View {
        NavigationView {
            List(restaurantViewModel.restaurants) { restaurant in
                NavigationLink(destination: RestaurantDetailView(restaurant: restaurant)) {
                    RestaurantRowView(restaurant: restaurant)
                }
            }
            .navigationTitle("Restaurants") 
        }
    }
}


// MARK: - Preview
struct RestaurantListView_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantListView()
            .environmentObject(RestaurantViewModel())
    }
}

