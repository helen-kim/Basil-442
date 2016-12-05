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

    var id:String = ""
    var allIngredients:Array<String> = []
    let ingRecipe = Recipes()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        id = ingViewModel!.id()
        
        // getIngredients returns dictionary with title and ingredients, ingredients is an array
        let ingredientInfo:Dictionary<String, AnyObject> = ingRecipe.getIngredients(id) as! Dictionary<String, AnyObject>
        allIngredients = (ingredientInfo["ingredients"] as! Array<String>)
        
        // Do any additional setup after loading the view.
    }
    @IBOutlet weak var ingredientsTableView: UITableView!

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


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
