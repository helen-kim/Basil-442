//
//  recipe.swift
//  Basil 442
//
//  Created by Sophie Zhao on 12/1/16.
//  Copyright © 2016 team danko_. All rights reserved.
//

import Foundation

class recipe {
    
    // Needed variables: first API call
    var recipeID: Int = 0
    var title: String = ""
    var readyInMinutes: Int = 0
    var imageURL: String = ""
    var dictOfRecipes: [Int:String] = [:]
    
    
    func apiRequest(url: String) -> String {
        
        
        return ""
    }
    
    
    func searchRecipes(query: String) -> String {
        // API request, establish URL and call function
        
        
        //Store variables
        
        return ""
    }
    
    func getRecipe(id: String) {
        
        getIngredients()
        
        getDirections()
        
    }
    
    func getIngredients() {
        
    }
    
    func getDirections() {
        
    }
    
    
}