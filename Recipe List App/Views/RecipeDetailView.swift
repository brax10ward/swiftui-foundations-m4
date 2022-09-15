//
//  RecipeDetailView.swift
//  Recipe List App
//
//  Created by Braxton Ward on 9/13/22.
//

import SwiftUI

struct RecipeDetailView: View {
    
    var recipe:Recipe
    @State private var selectedServingSize = 2
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                // MARK: Recipe Image
                Image(recipe.image)
                    .resizable()
                    .scaledToFill()
                    .cornerRadius(5)
                
                // MARK: Recipe Title
                Text(recipe.name)
                    .padding(.top, 40)
                    .padding(.leading)
                    .font(.largeTitle)
                    .bold()
                
                // MARK: Picker
                VStack (alignment: .leading) {
                    Text("Select your serving size:")
                        .font(.headline)
                    
                    Picker("", selection: $selectedServingSize) {
                        Text("2").tag(2)
                        Text("4").tag(4)
                        Text("6").tag(6)
                        Text("8").tag(8)
                    }
                    .pickerStyle(.segmented)
                    .frame(width: 200)
                }
                .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                
                
                Divider()
                
                // MARK: Ingredients
                VStack(alignment: .leading) {
                    Text("Ingredients")
                        .font(.headline)
                        .padding(.bottom, 5)
                    ForEach (recipe.ingredients) { i in
                        Text(" • " + RecipeModel.getPortion(ingredient: i, recipeServings: recipe.servings, targetServings: selectedServingSize) + " " + i.name.lowercased())
                    }
                }
                .padding(.all)
                
                // MARK: Divider
                Divider()
                
                // MARK: Directions
                VStack(alignment: .leading) {
                    Text("Directions")
                        .font(.headline)
                        .padding(.vertical)
                    
                    
                    ForEach(0..<recipe.directions.count, id: \.self) { index in
                        Text(String(index + 1) + ". " + recipe.directions[index])
                            .padding(.bottom, 5)
                        
                    }
                }
                .padding(.horizontal)
            }
            
        }
        
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        // Create a dummy recipe
        let model = RecipeModel()
        
        RecipeDetailView(recipe: model.recipes[0])
    }
}
