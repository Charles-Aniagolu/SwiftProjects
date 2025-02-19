//
//  RestaurantDetailView.swift
//  RestaurantApp
//
//  Created by Charles Nebo on 18.2.2025.
//

import SwiftUI

import SwiftUI

struct RestaurantDetailView: View {
    var restaurant: Restaurant

    var body: some View {
        VStack {
            Image(restaurant.imageName) 
                .resizable()
                .aspectRatio(contentMode: .fit)
            Text(restaurant.description)
                .padding()
            // Additional restaurant details can be added here
        }
        .navigationTitle(restaurant.name)
    }
}
