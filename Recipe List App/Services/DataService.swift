//
//  DataService.swift
//  Recipe List App
//
//  Created by Braxton Ward on 9/13/22.
//

import Foundation

class DataService {
    
    static func getLocalData() -> [Recipe] {
        // Parse local json file
        
        // get a url path to the json file
        let pathString = Bundle.main.path(forResource: "recipes", ofType: "json")
        
        // check if pathstring is not nil, otherwise
        guard pathString != nil else {
            return [Recipe]()
        }
        
        // create a url object
        let url = URL(fileURLWithPath: pathString!)
        
        do {
            // create a data object
            let data = try Data(contentsOf: url)
            
            // decode the json data
            let decoder = JSONDecoder()
            
            do {
                let recipeData = try decoder.decode([Recipe].self, from: data)
                
                for recipe in recipeData {
                    recipe.id = UUID()
                    
                    for ingredient in recipe.ingredients {
                        ingredient.id = UUID()
                    }
                }
                
                return recipeData
            } catch {
                print(error)
            }
        } catch {
            print(error)
        }
        
        return [Recipe]()
    }
    
}
