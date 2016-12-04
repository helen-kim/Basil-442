//
//  recipe.swift
//  Basil 442
//
//  Created by Sophie Zhao on 12/3/16.
//  Copyright © 2016 team danko_. All rights reserved.
//

struct Recipe {
    let id: Int
    let name: String
    let imageURL: String
    let time: String?
    let servings: String?
    let ingredients: Array<String>
    let directions: Array<String>
}