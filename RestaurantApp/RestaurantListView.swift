//
//  RestaurantListView.swift
//  RestaurantApp
//
//  Created by Charles Nebo on 18.2.2025.
//

import SwiftUI

struct RestaurantListView: View {
    @EnvironmentObject var viewModel: RestaurantViewModel

    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.restaurants) { restaurant in
                    HStack {
                        NavigationLink(destination: RestaurantDetailView(restaurant: restaurant)) {
                            HStack {
                                if let image = UIImage(named: restaurant.imageName) {
                                    Image(uiImage: image)
                                        .resizable()
                                        .frame(width: 50, height: 50)
                                        .clipShape(Circle())
                                } else {
                                    Image(systemName: "photo")
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
                        Spacer()
                        Button(action: {
                            viewModel.toggleFavorite(restaurant)
                        }) {
                            Image(systemName: viewModel.favorites.contains(restaurant.id) ? "heart.fill" : "heart")
                                .foregroundColor(.red)
                        }
                        .buttonStyle(BorderlessButtonStyle()) // ✅ Prevents triggering NavigationLink
                    }
                    .padding(.vertical, 5)
                }
            }
            .navigationTitle("Restaurants")
        }
    }
}

struct RestaurantListView_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantListView()
            .environmentObject(RestaurantViewModel())
    }
}






