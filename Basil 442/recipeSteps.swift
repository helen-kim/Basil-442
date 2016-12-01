//
//  recipeSteps.swift
//  Basil 442
//
//  Created by Sophie Zhao on 11/27/16.
//  Copyright © 2016 team danko_. All rights reserved.
//

import Foundation

class recipeSteps{
    
    var recipeID: String = "324694"
    var errorMessage: String = "Error"
    var currentStep: String = ""
    var currentNumber: Int = 0
    var instruction:[Int:String] = [:]
    
    func request(id: String) -> AnyObject {
        //        return "This is the text"
        
        let url = NSURL(string: "https://spoonacular-recipe-food-nutrition-v1.p.mashape.com/recipes/" + recipeID + "/analyzedInstructions")
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
        } else {
            return getInstructions(data!)
        }
    }
    
    func getInstructions(data: NSData) -> Dictionary<Int, String> {
        // get the json and transform into a dictionary
        do {
            let json = try NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments)
            for item in json as! [Dictionary<String, AnyObject>] {
                let steps = item["steps"] as! [Dictionary<String, AnyObject>]
                for step in steps {
                    let stepNumber = step["number"] as! Int
                    //
                    if (stepNumber == 1) {
                        currentNumber = stepNumber
                        if step["step"] != nil {
                            currentStep = step["step"] as! String
                        }
                    }
                    instruction[stepNumber] = step["step"] as? String
                }
            }
        } catch {
            return [404:"ERROR: JSON is not valid"]
        }
        return instruction
    }
    
    func getCurrentStep(data: NSData) {
        currentNumber+=1
        if instruction.count <= currentNumber {
            recipeCompleted()
        } else {
            currentStep = instruction[currentNumber]!
        }
    }
    
    func recipeCompleted() {
        
    }

}