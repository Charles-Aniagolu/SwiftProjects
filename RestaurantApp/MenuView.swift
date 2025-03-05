//
//  MenuView 2.swift
//  RestaurantApp
//
//  Created by Charles Nebo on 4.3.2025.
//


import SwiftUI

struct MenuView: View {
    var menu: Menu

    var body: some View {
        List(menu.dishes) { dish in
            HStack {
                VStack(alignment: .leading) {
                    Text(dish.name)
                        .font(.headline)
                    Text(dish.description)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    Text("€\(dish.price, specifier: "%.2f")")
                        .font(.subheadline)
                        .foregroundColor(.blue)
                }
                Spacer()
                Image(dish.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50, height: 50)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            }
        }
        .navigationTitle(menu.name)
    }
}
