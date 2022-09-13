//
//  RecipeModel.swift
//  Recipe List App
//
//  Created by Braxton Ward on 9/13/22.
//

import Foundation

class RecipeModel: ObservableObject {
    @Published var recipes = [Recipe]()
    
    init() {
        
        self.recipes = DataService.getLocalData()
    }
}
