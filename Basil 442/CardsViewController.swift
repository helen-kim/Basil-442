//
//  CardsViewController.swift
//  Basil 442
//
//  Created by Sophie Zhao on 12/1/16.
//  Copyright © 2016 team danko_. All rights reserved.
//

import UIKit

class CardsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    let recipeInstance = recipe()
    
    var allRecipes: Dictionary<Int, AnyObject> = [:]
    
    @IBOutlet weak var cardTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        allRecipes = recipeInstance.searchRecipes("burger")
        cardTableView.registerNib(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "recipeCell")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: - Table view data source
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return allRecipes.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("recipeCell", forIndexPath: indexPath) as! TableViewCell
        
        // Configure cell
        cell.cellRecipeName!.text = allRecipes[indexPath.row]!["title"] as? String
        cell.prepTime!.text = String(allRecipes[indexPath.row]!["readyInMinutes"])
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
