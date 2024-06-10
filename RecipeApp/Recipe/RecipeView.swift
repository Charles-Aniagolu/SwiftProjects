//
//  ContentView.swift
//  Recipe
//
//  Created by Charles Nebo on 7.6.2024.
//

import SwiftUI

struct RecipeView: View {
    var recipes: [Recipe] = [
            Recipe(name: "Spaghetti Carbonara", description: "Classic Italian pasta dish", imageName: "spaghetti-carbonara", ingredients: ["Spaghetti", "Eggs", "Parmesan cheese", "Pancetta"]),
            Recipe(name: "Chicken Curry", description: "Spicy and flavorful curry", imageName: "chicken-curry", ingredients: ["Chicken", "Curry powder", "Coconut milk", "Onions"]),
            Recipe(name: "Beef Tacos", description: "Delicious Mexican tacos", imageName: "beef-tacos", ingredients: ["Beef", "Taco shells", "Lettuce", "Cheese"]),
            Recipe(name: "Caesar Salad", description: "A classic Caesar salad with crisp romaine lettuce, creamy dressing, and crunchy croutons.", imageName: "caesar-salad", ingredients: ["Romaine lettuce", "Caesar dressing", "Parmesan cheese", "Croutons", "Lemon juice", "Olive oil", "Salt", "Pepper"]),
            Recipe(name: "Margherita Pizza", description: "Traditional Margherita pizza with a thin crust, fresh tomatoes, mozzarella, and basil.", imageName: "margherita-pizza", ingredients: ["Pizza dough", "Fresh tomatoes", "Mozzarella cheese", "Basil leaves", "Olive oil", "Salt"]),
            Recipe(name: "Chicken Alfredo Pasta", description: "Creamy Alfredo sauce with grilled chicken over fettuccine pasta.", imageName: "chicken-alfredo-pasta", ingredients: ["Fettuccine pasta", "Chicken breasts", "Heavy cream", "Parmesan cheese", "Butter", "Garlic", "Salt", "Pepper"]),
            Recipe(name: "Beef Stroganoff", description: "Tender beef strips in a rich mushroom and sour cream sauce, served over egg noodles.", imageName: "beef-stroganoff", ingredients: ["Beef sirloin", "Mushrooms", "Sour cream", "Onions", "Beef broth", "Flour", "Egg noodles", "Butter", "Salt", "Pepper"]),
            Recipe(name: "Vegetarian Tacos", description: "Flavorful vegetarian tacos with black beans, corn, avocado, and fresh salsa.", imageName: "vegetarian-tacos", ingredients: ["Corn tortillas", "Black beans", "Corn kernels", "Avocado", "Tomato", "Red onion", "Cilantro", "Lime", "Salt", "Pepper"]),
            Recipe(name: "Thai Green Curry", description: "Spicy and aromatic Thai green curry with chicken and vegetables.", imageName: "thai-green-curry", ingredients: ["Chicken breasts", "Green curry paste", "Coconut milk", "Green beans", "Bell peppers", "Bamboo shoots", "Thai basil", "Fish sauce", "Lime leaves"]),
            Recipe(name: "Blueberry Muffins", description: "Soft and moist blueberry muffins with a hint of vanilla and lemon zest.", imageName: "blueberry-muffins", ingredients: ["All-purpose flour", "Blueberries", "Sugar", "Butter", "Eggs", "Milk", "Baking powder", "Vanilla extract", "Lemon zest", "Salt"])
        ]
    
    var body: some View {
            NavigationView {
                List(recipes) { recipe in
                    NavigationLink(destination: RecipeDetailView(recipe: recipe)) {
                        HStack {
                            Image(recipe.imageName)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(height: 50)
                                .cornerRadius(10)
                            
                            VStack(alignment: .leading) {
                                Text(recipe.name)
                                    .bold()
                                Text(recipe.description)
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                            }
                            
                            Spacer()
                        }
                        .listRowSeparator(.hidden)
                        .listRowBackground(Color(.gray).opacity(0.1))
                    }
                }
                .listStyle(.plain)
                .navigationTitle("Recipes")
            }
        }
    }

    struct RecipeView_Previews: PreviewProvider {
        static var previews: some View {
            RecipeView()
        }
    }
