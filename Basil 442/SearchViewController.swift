//
//  HomeViewController.swift
//  Basil 442
//
//  Created by Sophie Zhao on 12/1/16.
//  Copyright © 2016 team danko_. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController, UISearchBarDelegate {
    @IBOutlet weak var searchBar: UISearchBar!
    
    var searchActive : Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()
        let img = UIImage()
        self.navigationController?.navigationBar.shadowImage = img
        self.navigationController?.navigationBar.setBackgroundImage(img, forBarMetrics: UIBarMetrics.Default)
        
        searchBar.delegate = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - SearchBar
    func searchBarTextDidBeginEditing(searchBar: UISearchBar) {
        searchActive = true
        
    }
    
    func searchBarTextDidEndEditing(searchBar: UISearchBar) {
        searchActive = false
    }
    
    func searchBarCancelButtonClicked(searchBar: UISearchBar) {
        searchBar.text = ""
        // Hide the cancel button
        searchActive = false
    }
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        searchActive = false
        performSegueWithIdentifier("toCardSegue", sender: searchBar.text)
        searchBar.text = ""
    }
    
    // MARK: - Segues
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let cardsVC = segue.destinationViewController as? CardsViewController,
            q = sender as? String {
            cardsVC.cardsViewModel = CardsViewModel(query: q)
        }
    }
}
