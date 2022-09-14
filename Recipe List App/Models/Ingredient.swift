//
//  Ingredient.swift
//  Recipe List App
//
//  Created by Braxton Ward on 9/14/22.
//

import Foundation

class Ingredient: Identifiable, Decodable {
    var id: UUID?
    var name: String
    var num: Int?
    var denom: Int?
    var unit: String?
    
    
}
