//
//  StepsViewController.swift
//  Basil 442
//
//  Created by Sophie Zhao on 11/27/16.
//  Copyright © 2016 team danko_. All rights reserved.
//

import UIKit

class StepsViewController: UIViewController {
    
    var stepViewModel:StepsViewModel?

    var allDirections:Array<String> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        allDirections = stepViewModel!.directions()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var prevStep: UILabel!
    @IBOutlet weak var currStep: UILabel!
    @IBOutlet weak var nextStep: UILabel!

    
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var repeatButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    
    func updateSteps() {
        
    }
    
    func initializeSteps() {
    
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
