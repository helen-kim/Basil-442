//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
//: Playground - noun: a place where people can play


import Foundation

let id = 831906
let query = "chicken"

// test searchRecipes method
let urlSearch = NSURL(string: "https://spoonacular-recipe-food-nutrition-v1.p.mashape.com/recipes/search?number=30&query="+query)
let requestSearch = NSMutableURLRequest(URL: urlSearch!)
requestSearch.HTTPMethod = "GET"
requestSearch.setValue("iT7alpV4wxmshQQDyVZiaVJE5qAGp1Xhqkkjsn89TCTiZYAcvg", forHTTPHeaderField: "X-Mashape-Key")

var responseSearch: NSURLResponse?
let errorSearch: NSErrorPointer = nil

var dataSearch: NSData?
do {
    dataSearch = try NSURLConnection.sendSynchronousRequest(requestSearch, returningResponse: &responseSearch)
} catch let error1 as NSError {
    errorSearch.memory = error1
    dataSearch = nil
}
// ensure that the API call was successful
if dataSearch == nil {
    print("ERROR: API request failed; make sure the URL is correct")
}

do {
    let jsonSearch = try NSJSONSerialization.JSONObjectWithData(dataSearch!, options: .AllowFragments) as! Dictionary<String, AnyObject>
    print(jsonSearch["results"]!)
}

// test getRecipeDetails method
let urlDet = NSURL(string: "https://spoonacular-recipe-food-nutrition-v1.p.mashape.com/recipes/\(id)/information?includeNutrition=false")
let requestDet = NSMutableURLRequest(URL: urlDet!)
requestDet.HTTPMethod = "GET"
requestDet.setValue("iT7alpV4wxmshQQDyVZiaVJE5qAGp1Xhqkkjsn89TCTiZYAcvg", forHTTPHeaderField: "X-Mashape-Key")

var responseDet: NSURLResponse?
let errorDet: NSErrorPointer = nil

var dataDet: NSData?
do {
    dataDet = try NSURLConnection.sendSynchronousRequest(requestDet, returningResponse: &responseDet)
} catch let error1 as NSError {
    errorDet.memory = error1
    dataDet = nil
}
// ensure that the API call was successful
if dataDet == nil {
    print("ERROR: API request failed; make sure the URL is correct")
}

do {
    let jsonDet = try NSJSONSerialization.JSONObjectWithData(dataDet!, options: .AllowFragments) as! Dictionary<String, AnyObject>
    var details: Dictionary<String, AnyObject> = [:]
    details["title"] = jsonDet["title"]
    details["imageURL"] = jsonDet["image"]
    details["time"] = jsonDet["readyInMinutes"]
    details["servings"] = jsonDet["servings"]
    
    print(details)
    var time: Int = 0
    time = details["time"] as! Int
    var strTime = String(time)
    print(time)
}

// test getIngredients method
let urlIng = NSURL(string: "https://spoonacular-recipe-food-nutrition-v1.p.mashape.com/recipes/\(id)/information?includeNutrition=false")
let requestIng = NSMutableURLRequest(URL: urlIng!)
requestIng.HTTPMethod = "GET"
requestIng.setValue("iT7alpV4wxmshQQDyVZiaVJE5qAGp1Xhqkkjsn89TCTiZYAcvg", forHTTPHeaderField: "X-Mashape-Key")

var responseIng: NSURLResponse?
let errorIng: NSErrorPointer = nil

var dataIng: NSData?
do {
    dataIng = try NSURLConnection.sendSynchronousRequest(requestIng, returningResponse: &responseIng)
} catch let error1 as NSError {
    errorIng.memory = error1
    dataIng = nil
}
// ensure that the API call was successful
if dataIng == nil {
    print("ERROR: API request failed; make sure the URL is correct")
}

do {
    let jsonIng = try NSJSONSerialization.JSONObjectWithData(dataIng!, options: .AllowFragments) as! Dictionary<String, AnyObject>
    var ingredients: [String] = []
    let ingDict: [Dictionary<String, AnyObject>] = jsonIng["extendedIngredients"]! as! [Dictionary<String, AnyObject>]
    for item in ingDict {
        let ingredient: String = item["name"] as! String
        ingredients.append(ingredient)
    }
    var details: Dictionary<String, AnyObject> = [:]
    details["title"] = jsonIng["title"]
    details["ingredients"] = ingredients
    
    print(details)
}

// test getDirections method
let urlDir = NSURL(string: "https://spoonacular-recipe-food-nutrition-v1.p.mashape.com/recipes/\(id)/analyzedInstructions?stepBreakdown=true")
let requestDir = NSMutableURLRequest(URL: urlDir!)
requestDir.HTTPMethod = "GET"
requestDir.setValue("iT7alpV4wxmshQQDyVZiaVJE5qAGp1Xhqkkjsn89TCTiZYAcvg", forHTTPHeaderField: "X-Mashape-Key")

var responseDir: NSURLResponse?
let errorDir: NSErrorPointer = nil

var dataDir: NSData?
do {
    dataDir = try NSURLConnection.sendSynchronousRequest(requestDir, returningResponse: &responseDir)
} catch let error1 as NSError {
    errorDir.memory = error1
    dataDir = nil
}
// ensure that the API call was successful
if dataDir == nil {
    print("ERROR: API request failed; make sure the URL is correct")
}

do {
    let jsonDir = try NSJSONSerialization.JSONObjectWithData(dataDir!, options: .AllowFragments) as! [Dictionary<String, AnyObject>]
    var directions: [String] = []
    var mainSteps = jsonDir[0]["steps"] as! [Dictionary<String, AnyObject>]
    if mainSteps == [] {
        mainSteps = jsonDir[1]["steps"] as! [Dictionary<String, AnyObject>]
    }

    for stepInfo in mainSteps {
        let step = stepInfo["step"] as! String
        directions.append(step)
    }
    
    print(directions)
}
