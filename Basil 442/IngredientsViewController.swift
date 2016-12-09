//
//  IngredientsViewController.swift
//  Basil 442
//
//  Created by Sophie Zhao on 12/1/16.
//  Copyright © 2016 team danko_. All rights reserved.
//

import UIKit

class IngredientsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var ingViewModel:IngredientsViewModel?

    var allIngredients:Array<String> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // getIngredients returns dictionary with title and ingredients, ingredients is an array
        allIngredients = ingViewModel!.ingredients()
        recipeTitle.text = ingViewModel!.name()
        
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var ingredientsTableView: UITableView!
    @IBOutlet weak var recipeTitle: UILabel!

    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Ingredients Table view data source
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        return allIngredients.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ingredientCell", forIndexPath: indexPath) as! IngredientsTableViewCell
        
        // Configure cell
        cell.ingredientName.text = allIngredients[indexPath.row]
        cell.selectionStyle = .None
        return cell
    }
    
    // MARK: - Directions Segue
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "toDirectionsSegue" {
            if let destination = segue.destinationViewController as? DirectionsViewController {
                destination.dirViewModel = DirectionsViewModel(recipe: ingViewModel!.recipe, source: ingViewModel!.source)
            }
        }
    }
    
    @IBAction func unwindToIng(segue: UIStoryboardSegue) {}
    
    @IBAction func swipeOut(sender: UISwipeGestureRecognizer) {
        if ingViewModel!.source == "home" {
            self.performSegueWithIdentifier("unwindToHome", sender: self)
        } else if ingViewModel!.source == "cards" {
            self.performSegueWithIdentifier("unwindToCards", sender: self)
        }
    }
    
    
    @IBAction func downButtonPressed(sender: UIButton) {
        if ingViewModel!.source == "home" {
            self.performSegueWithIdentifier("unwindToHome", sender: self)
        } else if ingViewModel!.source == "cards" {
            self.performSegueWithIdentifier("unwindToCards", sender: self)
        }
    }
   

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
