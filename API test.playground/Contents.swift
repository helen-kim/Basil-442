//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
//: Playground - noun: a place where people can play


import Foundation

let id = 775954
let query = "chicken"
let spaces = "salmon"

// test randomRecipes method
let urlRand = NSURL(string: "https://spoonacular-recipe-food-nutrition-v1.p.mashape.com/recipes/random?limitLicense=false&number=1")
let requestRand = NSMutableURLRequest(URL: urlRand!)
requestRand.HTTPMethod = "GET"
requestRand.setValue("iT7alpV4wxmshQQDyVZiaVJE5qAGp1Xhqkkjsn89TCTiZYAcvg", forHTTPHeaderField: "X-Mashape-Key")

var responseRand: NSURLResponse?
let errorRand: NSErrorPointer = nil

var dataRand: NSData?
do {
    dataRand = try NSURLConnection.sendSynchronousRequest(requestRand, returningResponse: &responseRand)
} catch let error1 as NSError {
    errorRand.memory = error1
    dataRand = nil
}
// ensure that the API call was successful
if dataRand == nil {
    print("ERROR: API request failed; make sure the URL is correct")
}

do {
    let jsonRand = try NSJSONSerialization.JSONObjectWithData(dataRand!, options: .AllowFragments) as! Dictionary<String, AnyObject>
    let rnd = jsonRand["recipes"]![0] as! Dictionary<String, AnyObject>
    print(rnd["instructions"])
    var info: Dictionary<String, AnyObject> = [:]
    info["id"] = rnd["id"] as! Int
    info["title"] = rnd["title"] as! String
    info["imageURL"] = rnd["image"] as! String
    info["time"] = rnd["readyInMinutes"] as! Int
    info["servings"] = rnd["servings"] as! Int
}


// test searchRecipes method
let reformat = spaces.componentsSeparatedByString(" ").joinWithSeparator("+")
let urlSearch = NSURL(string: "https://spoonacular-recipe-food-nutrition-v1.p.mashape.com/recipes/search?number=30&query="+reformat)
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
var recipeList:[Int:AnyObject] = [:]
do {
    let jsonSearch = try NSJSONSerialization.JSONObjectWithData(dataSearch!, options: .AllowFragments) as! Dictionary<String, AnyObject>
    print(jsonSearch)
    let res = jsonSearch["results"] as! [Dictionary<String, AnyObject>]
    var count:Int = 0
    for item in res {
        recipeList[count] = item
        count = count + 1
    }
}
recipeList[1]!["title"]
recipeList[2]!["readyInMinutes"]
if let receiver = recipeList[2] {
    if let temp = receiver["readyInMinutes"] as? String {
        print("Success")
    }
}
let im:String = "https://spoonacular.com/recipeImages/"

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
    let uniqueIng = Array(Set(ingredients))
    var details: Dictionary<String, AnyObject> = [:]
    details["title"] = jsonIng["title"]
    details["ingredients"] = uniqueIng
    
    print(details)
    print(jsonIng["instructions"])
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
    if jsonDir != [] {
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
    } else {
        print(jsonDir)
    }
}
