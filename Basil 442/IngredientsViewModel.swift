//
//  IngredientsViewModel.swift
//  Basil 442
//
//  Created by Sophie Zhao on 12/4/16.
//  Copyright © 2016 team danko_. All rights reserved.
//

import Foundation

class IngredientsViewModel {
    let recipe: Recipe
    
    init(recipe: Recipe) {
        self.recipe = recipe
    }
    
    func name() -> String {
        return recipe.name
    }
    
    func ingredients() -> Array<String> {
        return recipe.ingredients
    }
    
}