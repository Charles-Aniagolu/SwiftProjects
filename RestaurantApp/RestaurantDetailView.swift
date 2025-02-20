//
//  RestaurantDetailView.swift
//  RestaurantApp
//
//  Created by Charles Nebo on 18.2.2025.
//

import SwiftUI

struct RestaurantDetailView: View {
    var restaurant: Restaurant

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                // Restaurant Image with Professional Touch
                ZStack {
                    Rectangle()
                        .fill(Color(.systemGray6)) // Adds a light background for contrast
                        .frame(width: UIScreen.main.bounds.width - 30, height: 200)
                        .cornerRadius(12)
                        .shadow(color: Color.black.opacity(0.15), radius: 5, x: 0, y: 3)

                    Image(restaurant.imageName)
                        .resizable()
                        .scaledToFill() // Ensures it fills the frame properly
                        .frame(width: UIScreen.main.bounds.width - 30, height: 200)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                        .clipped() // Ensures no overflow
                }
                .padding(.horizontal, 15)
                .padding(.top, 5)

                // Restaurant Name (Title)
                Text(restaurant.name)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
                    .padding(.horizontal, 15)

                // Restaurant Description
                Text(restaurant.description)
                    .font(.body)
                    .foregroundColor(.secondary)
                    .padding(.horizontal, 15)
                    .padding(.bottom, 10)

                Spacer()
            }
        }
        .navigationBarTitle(restaurant.name, displayMode: .inline)
    }
}
