//
//  Recipe.swift
//  Recipe List App
//
//  Created by Braxton Ward on 9/13/22.
//

import Foundation

class Recipe: Identifiable, Decodable {
    var id: UUID?
    var name: String
    var featured: Bool
    var image: String
    var description: String
    var highlights: [String]
    var prepTime: String
    var cookTime: String
    var totalTime: String
    var servings: Int
    var ingredients: [Ingredient]
    var directions: [String]
}
