//
//  DetailViewController.swift
//  Basil 442
//
//  Created by Sophie Zhao on 12/1/16.
//  Copyright © 2016 team danko_. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    var viewModel: DetailViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view.
    }

    @IBOutlet weak var recipeImage: UIImageView!
    @IBOutlet weak var recipeTitle: UILabel!
    
    @IBOutlet weak var recipeTime: UILabel!
    
    @IBOutlet weak var recipeServings: UILabel!
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
            
        recipeTitle.text = viewModel?.name()
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "toIngredientsSegue" {
            if let destination = segue.destinationViewController as? IngredientsViewController {
                destination.ingViewModel = IngredientsViewModel(recipe: viewModel!.recipe)
            }
        }
    }
}
