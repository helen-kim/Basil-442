//
//  HomeViewController.swift
//  Basil 442
//
//  Created by Other on 12/4/16.
//  Copyright © 2016 team danko_. All rights reserved.
//
import UIKit

class HomeViewController: UIViewController {
    let recipeInstance = Recipes()
    var rnd: Dictionary<String, AnyObject> = [:]
    
    @IBOutlet weak var recipeTitle: UILabel!
    @IBOutlet weak var recipeTime: UILabel!
    @IBOutlet weak var recipeImage: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let img = UIImage()
        self.navigationController?.navigationBar.shadowImage = img
        self.navigationController?.navigationBar.setBackgroundImage(img, forBarMetrics: UIBarMetrics.Default)
        
        rnd = recipeInstance.getRandomRecipe() as! Dictionary<String, AnyObject>
        recipeTitle.text = rnd["title"] as? String
        let time = rnd["time"] as! Int
        recipeTime.text = String(time)
        // Do any additional setup after loading the view.
        
        
        // Setup image view
        if let img = rnd["imageURL"] {
            let endString:String = img as! String
            let url:NSURL? = NSURL(string: endString)
            let data:NSData? = NSData(contentsOfURL : url!)
            let image = UIImage(data : data!)
            recipeImage.image = image
        }
        else {
            let imgString:String = "https://spoonacular.com/recipeImages/beef-burgundy-2-101141.jpg"
            let url:NSURL? = NSURL(string: imgString)
            let data:NSData? = NSData(contentsOfURL : url!)
            let image = UIImage(data : data!)
            recipeImage.image = image
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getRelevantData() -> Recipe {
        let idInt = rnd["id"] as! Int
        let id = String(idInt)
        let title = rnd["title"] as! String
        let timeInt = rnd["time"] as! Int
        let time = String(timeInt)
        let servingsInt = rnd["servings"] as! Int
        let servings = String(servingsInt)
        let image = rnd["imageURL"] as! String
        
        // Get ingredients
        let ingredientInfo:Dictionary<String, AnyObject> = recipeInstance.getIngredients(id) as! Dictionary<String, AnyObject>
        let ingredientsList:Array<String> = (ingredientInfo["ingredients"] as! Array<String>)
        
        // Get directions
        let directionsList:Array<String> = recipeInstance.getDirections(id)
        
        // Create Recipe instance with current recipe
        let selectedRecipe = Recipe(id:id, name:title, imageURL:image, time:time, servings:servings, ingredients:ingredientsList, directions:directionsList)
        
        return selectedRecipe
    }
    
    func sendToIngredientsViewModel() -> IngredientsViewModel{
        let selectedRecipe = getRelevantData()
        return IngredientsViewModel(recipe: selectedRecipe, source: "home")
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let ingVC = segue.destinationViewController as? IngredientsViewController {
            ingVC.ingViewModel = sendToIngredientsViewModel()
        }
    }
    
    @IBAction func unwindToHome(segue: UIStoryboardSegue) {}
    
    /*
     // MARK: - Navigation
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}