//
//  RecipeItem.swift
//  Recipe
//
//  Created by Charles Nebo on 9.6.2024.
//

import Foundation
struct Recipe: Identifiable {
    var id: UUID = UUID()
    
    var name: String
    var description: String
    var imageName: String
    var ingredients: [String]
    var isFavorite: Bool = false

    
}
