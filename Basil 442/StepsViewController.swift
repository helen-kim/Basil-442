//
//  StepsViewController.swift
//  Basil 442
//
//  Created by Sophie Zhao on 11/27/16.
//  Copyright © 2016 team danko_. All rights reserved.
//

import UIKit
import AVFoundation

class StepsViewController: UIViewController {
    
    
    var stepViewModel:StepsViewModel?
    let speechSynthesizer = AVSpeechSynthesizer()
    var isSpeechStopped:Bool = false
    
    var allDirections:Array<String> = []
    var currentStep: Int = 0
    var nextStep: Int = 1
    var previousStep: Int = 0
    let emptyString: Int = -1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        allDirections = ["BEGIN"] + stepViewModel!.directions()
        allDirections.append("DONE")
        prevStep.text = ""
        currStep.text = allDirections[currentStep]
        nexStep.text = allDirections[nextStep]
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var prevStep: UILabel!
    @IBOutlet weak var currStep: UILabel!
    @IBOutlet weak var nexStep: UILabel!

    
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var repeatButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    
    @IBAction func nextClicked(sender: UIButton) {
        increaseStepIndices()
        readDirection()
    }
    
    @IBAction func previousClicked(sender: UIButton) {
        decreaseStepIndices()
        readDirection()
    }
    
    func decreaseStepIndices() {
        if currentStep <  0 {
            return endInstructions()
        }
        
        if currentStep > 0 {
            currentStep = currentStep - 1
        }
        
        // Increment next only if current step is not at the top
        if currentStep == 0 {
            nextStep = nextStep - 1
            previousStep = emptyString
        } else {
            nextStep = currentStep + 1
            // Increment previous as 1 less than current
            previousStep = currentStep - 1
        }
        assignText()

    }
    
    func increaseStepIndices() {
        // directions done if currentStep is past last step
        if currentStep >= allDirections.count + 1{
            
            return endInstructions()
        }
        if currentStep <= allDirections.count + 1{
            currentStep = currentStep + 1
        }
        // Increment next only if current step is not at the top
        if currentStep == allDirections.count {
            nextStep = 0
            previousStep = currentStep - 1
        } else {
            nextStep = nextStep + 1
            // Increment previous as 1 less than current
            previousStep = currentStep - 1
        }
        assignText()
    }
    
    func assignText() {
        // If reach end
        print(nextStep)
        if nextStep == allDirections.count {
            nexStep.text = ""
            currStep.text = allDirections[currentStep]
            prevStep.text = allDirections[previousStep]
        }
        else if nextStep == allDirections.count + 1 {
            endInstructions()
        }
        // If just starting
        else if previousStep == emptyString {
            prevStep.text = ""
            currStep.text = allDirections[currentStep]
            nexStep.text = allDirections[nextStep]
        }
        else {
            nexStep.text = allDirections[nextStep]
            currStep.text = allDirections[currentStep]
            prevStep.text = allDirections[previousStep]
        }
        isSpeechStopped = speechSynthesizer.stopSpeakingAtBoundary(AVSpeechBoundary.Immediate)
        
    }
    
    func endInstructions() {
        
    }
    
    func readDirection() {
        let speechUtterance = AVSpeechUtterance(string: allDirections[currentStep])
        speechUtterance.preUtteranceDelay = 0.3
        speechSynthesizer.speakUtterance(speechUtterance)
        
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
