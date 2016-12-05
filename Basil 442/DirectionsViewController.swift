//
//  DirectionsViewController.swift
//  Basil 442
//
//  Created by Sophie Zhao on 12/1/16.
//  Copyright © 2016 team danko_. All rights reserved.
//

import UIKit

class DirectionsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // Initialize Recipes
    var dirInfo = Recipes()
    
    var id:String = "831906"
    var allDirections:Array<String> = []


    override func viewDidLoad() {
        super.viewDidLoad()
        allDirections = dirInfo.getDirections(id)

        // Do any additional setup after loading the view.
    }
    @IBOutlet weak var directionsTableView: UITableView!
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Directions Table view data source
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return allDirections.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("directionCell", forIndexPath: indexPath) as! DirectionsTableViewCell
        
        // Configure cell
        cell.directionName.text = allDirections[indexPath.row]
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
