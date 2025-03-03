//
//  RestaurantRow.swift
//  RestaurantApp
//
//  Created by Charles Nebo on 19.2.2025.
//

import SwiftUI

struct RestaurantRowView: View {
    let restaurant: Restaurant

    var body: some View {
        HStack {
            if let image = UIImage(named: restaurant.imageName) {
                Image(uiImage: image)
                    .resizable()
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
            } else {
                Image(systemName: "photo") // Placeholder if image is missing
                    .resizable()
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
                    .foregroundColor(.gray)
            }
            
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
