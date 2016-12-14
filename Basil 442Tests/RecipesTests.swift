//
//  RecipesTests.swift
//  Basil 442
//
//  Created by Sophie Zhao on 12/14/16.
//  Copyright © 2016 team danko_. All rights reserved.
//

import XCTest
@testable import Basil_442

class RecipesTests: XCTestCase {
    
    var testModel: Recipes! = Recipes()

    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        self.testModel = Recipes()

    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testAPIRequest() {
        let data = self.testModel.apiRequest("https://spoonacular-recipe-food-nutrition-v1.p.mashape.com/recipes/search?number=30&query=salmon")
        let type:Bool = data is String
        XCTAssertTrue(!type)
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
    }
    
    func testGetIngredients(){
        let data = self.testModel.getIngredients("775954")
        XCTAssertTrue(data["title"] == "Roast Salmon and Broccoli with Chile-Caper Vinaigrette")
    }
    
    func testGetDirections() {
        let data = self.testModel.getDirections("775954")
        XCTAssertTrue(data[0] == "Preheat oven to 400. Toss broccoli and 2 Tbsp. oil on a large rimmed baking sheet; season with salt and pepper. Roast, tossing occasionally, until browned and crisp-tender, 1215 minutes.")
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }
    
}
