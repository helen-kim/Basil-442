//
//  DetailViewModel.swift
//  Basil 442
//
//  Created by Sophie Zhao on 12/3/16.
//  Copyright © 2016 team danko_. All rights reserved.
//

import Foundation

class DetailViewModel {
    let recipe: Recipe
    
    init(recipe: Recipe) {
        self.recipe = recipe
    }
    
    func id() -> Int {
        return recipe.id
    }
    
    func name() -> String {
        return recipe.name
    }
    
    func imageURL() -> String {
        return recipe.imageURL
    }
    
    func time() -> String? {
        return recipe.time
    }
    
    func servings() -> String? {
        return recipe.servings
    }
    
    func ingredients() -> Array<String> {
        return recipe.ingredients
    }
    
    func directions() -> Array<String> {
        return recipe.directions
    }
    
    
}