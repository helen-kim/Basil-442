//
//  recipeRead.swift
//  Basil 442
//
//  Created by Sophie Zhao on 11/17/16.
//  Copyright © 2016 team danko_. All rights reserved.
//
//
//  RecipeRead.swift
//  Recipe Reader
//
//  Created by Sophie Zhao on 11/3/16.
//  Copyright © 2016 Sophie Zhao. All rights reserved.
//

import Foundation
import AVFoundation

class RecipeRead{
    
    var recipeID: String = "324694"
    var errorMessage: String = "Error"
    
    func request(text: String) -> Dictionary<Int, String> {
        //        return "This is the text"
        
        let url = NSURL(string: "https://spoonacular-recipe-food-nutrition-v1.p.mashape.com/recipes/324694/analyzedInstructions")
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
            return [404:"ERROR: API request failed; make sure the URL is correct"]
        }
        
        var instruction:[Int:String] = [:]
        do {
            let json = try NSJSONSerialization.JSONObjectWithData(data!, options: .AllowFragments)
            for item in json as! [Dictionary<String, AnyObject>] {
                let steps = item["steps"] as! [Dictionary<String, AnyObject>]
                for step in steps {
                    let stepNumber = step["number"] as! Int
                    instruction[stepNumber] = step["step"] as? String
                }
            }
        } catch {
            return [404:"ERROR: JSON is not valid"]
        }
        return instruction
    }
}