//
//  DirectionsViewModel.swift
//  Basil 442
//
//  Created by Sophie Zhao on 12/5/16.
//  Copyright © 2016 team danko_. All rights reserved.
//

import Foundation

class DirectionsViewModel {
    let recipe: Recipe
    let source: String
    
    init(recipe: Recipe, source: String) {
        self.recipe = recipe
        self.source = source
    }
    
    func name() -> String {
        return recipe.name
    }
    
    func directions() -> Array<String> {
        return recipe.directions
    }
}