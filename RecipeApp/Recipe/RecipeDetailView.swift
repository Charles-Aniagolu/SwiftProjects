//
//  RecipeDetailView.swift
//  Recipe
//
//  Created by Charles Nebo on 9.6.2024.
//

import SwiftUI



struct RecipeDetailView: View {
        var recipe: Recipe
        
        var body: some View {
            ScrollView {
                VStack(alignment: .leading) {
                    Image(recipe.imageName)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(10)
                        .padding()
                    
                    Text(recipe.name)
                        .font(.largeTitle)
                        .bold()
                        .padding(.horizontal)
                    
                    Text("Ingredients")
                        .font(.headline)
                        .padding([.top, .horizontal])
                    
                    ForEach(recipe.ingredients, id: \.self) { ingredient in
                        Text("• \(ingredient)")
                            .padding(.horizontal)
                    }
                    
                    Text("Description")
                        .font(.headline)
                        .padding([.top, .horizontal])
                    
                    Text(recipe.description)
                        .padding([.horizontal, .bottom])
                }
            }
            .navigationBarTitleDisplayMode(.inline)
        }
    }

    struct RecipeDetailView_Previews: PreviewProvider {
        static var previews: some View {
            RecipeDetailView(recipe: Recipe(name: "Sample Recipe", description: "Delicious sample recipe", imageName: "spaghetti-carbonara", ingredients: ["Ingredient 1", "Ingredient 2"]))
        }
    }
