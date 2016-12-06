//
//  StepsViewModel.swift
//  Basil 442
//
//  Created by Sophie Zhao on 12/5/16.
//  Copyright © 2016 team danko_. All rights reserved.
//

import Foundation

class StepsViewModel {
    let recipe: Recipe
    
    init(recipe: Recipe) {
        self.recipe = recipe
    }
    
    func name() -> String {
        return recipe.name
    }

    func directions() -> Array<String> {
        return recipe.directions
    }
    
}