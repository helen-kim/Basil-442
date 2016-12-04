//
//  recipe.swift
//  Basil 442
//
//  Created by Sophie Zhao on 12/1/16.
//  Copyright © 2016 team danko_. All rights reserved.
//

import Foundation

class Recipes {
    
    var recipeList:[Int:AnyObject] = [:]

    // MARK: - API Requests
    func apiRequest(url: String) -> AnyObject {
        // return full JSON from API request
        let url = NSURL(string: url)
        let request = NSMutableURLRequest(URL: url!)
        request.HTTPMethod = "GET"
        request.setValue("iT7alpV4wxmshQQDyVZiaVJE5qAGp1Xhqkkjsn89TCTiZYAcvg", forHTTPHeaderField: "X-Mashape-Key")
        
        var response: NSURLResponse?
        let error: NSErrorPointer = nil
        
        var data: NSData?
        do {
            data = try NSURLConnection.sendSynchronousRequest(request, returningResponse: &response)
        } catch let error1 as NSError {
            error.memory = error1
            data = nil
        }
        
        // ensure that the API call was successful
        if data == nil {
            return "ERROR: API request failed; make sure the URL is correct"
        } else {
            return data!
        }
    }
    
    // MARK: - Search recipes using keyword/words
    func searchRecipes(query: String) -> Dictionary<Int, AnyObject> {
        // API request, establish URL and call function
        let searchData = apiRequest("https://spoonacular-recipe-food-nutrition-v1.p.mashape.com/recipes/search?number=30&query="+query)
        // Confirm API request successful
        if searchData is String {
            return [404: "ERROR: API request failed; make sure the URL is correct"]
        } else {
            // get results
            do {
                let json = try NSJSONSerialization.JSONObjectWithData(searchData as! NSData, options: .AllowFragments) as! Dictionary<String, AnyObject>
                var count:Int = 0
                for item in json["results"] as! [Dictionary<String, AnyObject>] {
                    recipeList[count] = item
                    count = count + 1
                }
            } catch {
                return [404:"ERROR: JSON is not valid"]
            }
        }
        return recipeList
    }
    
    // MARK: - Get summarized recipe detail dictionary
    func getRecipeDetails(id: String) -> AnyObject {
        // API request, establish URL and call function
        let recipeData = apiRequest("https://spoonacular-recipe-food-nutrition-v1.p.mashape.com/recipes/\(id)/information?includeNutrition=false")
        // Confirm API request successful
        if recipeData as! String == "404:ERROR: API request failed; make sure the URL is correct" {
            return [404: "ERROR: API request failed; make sure the URL is correct"]
        } else {
            // parse through JSON and gather necessary title, imageURL, time, and servings information
            do {
                let json = try NSJSONSerialization.JSONObjectWithData(recipeData as! NSData, options: .AllowFragments) as! Dictionary<String, AnyObject>
                var details: Dictionary<String, AnyObject> = [:]
                details["title"] = json["title"]
                details["imageURL"] = json["image"]
                details["time"] = json["readyInMinutes"]
                details["servings"] = json["servings"]
                
                return details
            } catch {
                return [404:"ERROR: JSON is not valid"]
            }
        }
    }
    
    // MARK: - Get ingredients information
    func getIngredients(id: String) -> AnyObject{
        // API request, establish URL and call function
        let recipeData = apiRequest("https://spoonacular-recipe-food-nutrition-v1.p.mashape.com/recipes/\(id)/information?includeNutrition=false")
        // Confirm API request successful
        if let isString = recipeData as? String {
            return [404: "ERROR: API request failed; make sure the URL is correct"]
        } else {
            // parse through JSON and gather necessary title and ingredients
            do {
                let json = try NSJSONSerialization.JSONObjectWithData(recipeData as! NSData, options: .AllowFragments) as! Dictionary<String, AnyObject>
                
                var ingredients: [String] = []
                let ingDict: [Dictionary<String, AnyObject>] = json["extendedIngredients"]! as! [Dictionary<String, AnyObject>]
                for item in ingDict {
                    let ingredient: String = item["name"] as! String
                    ingredients.append(ingredient)
                }
                var details: Dictionary<String, AnyObject> = [:]
                details["title"] = json["title"]
                details["ingredients"] = ingredients
                
                return details
            } catch {
                return [404:"ERROR: JSON is not valid"]
            }
        }
    }
    
    // MARK: - Get directions information
    func getDirections(id: String) -> Array<String> {
        // API request, establish URL and call function
        let recipeData = apiRequest("https://spoonacular-recipe-food-nutrition-v1.p.mashape.com/recipes/\(id)/analyzedInstructions?stepBreakdown=true")
        // Confirm API request successful
        if let isString = recipeData as? String {
            return ["404 ERROR: API request failed; make sure the URL is correct"]
        } else {
            // parse through JSON and gather necessary directions
            do {
                let json = try NSJSONSerialization.JSONObjectWithData(recipeData as! NSData, options: .AllowFragments) as! [Dictionary<String, AnyObject>]
                var directions: [String] = []
                var mainSteps = json[0]["steps"] as! [Dictionary<String, AnyObject>]
                if mainSteps == [] {
                    mainSteps = json[1]["steps"] as! [Dictionary<String, AnyObject>]
                }
                
                for stepInfo in mainSteps {
                    let step = stepInfo["step"] as! String
                    directions.append(step)
                }
                
                return directions
            } catch {
                return ["404 ERROR: JSON is not valid"]
            }
        }
    }
}