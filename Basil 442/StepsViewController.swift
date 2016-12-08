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
    var previousStep: Int = -1
    var isBegin: Bool = false
    var isEnd: Bool = false
    let emptyString: Int = -1
    var totalSteps: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        recipeTitle.text = stepViewModel!.name()
        allDirections = ["BEGIN"] + stepViewModel!.directions()
        allDirections.append("DONE")
        prevStep.text = ""
        currStep.text = allDirections[currentStep]
        nexStep.text = allDirections[nextStep]
        totalSteps = allDirections.count

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    
    @IBOutlet weak var recipeTitle: UILabel!
    @IBOutlet weak var prevStep: UILabel!
    @IBOutlet weak var currStep: UILabel!
    @IBOutlet weak var nexStep: UILabel!

    
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var repeatButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    
    
    
    @IBAction func repeatClicked(sender: UIButton) {
        readDirection()
    }
    
    @IBAction func finishClicked(sender: UIButton) {
        speechSynthesizer.stopSpeakingAtBoundary(AVSpeechBoundary.Immediate)
    }
    
    @IBAction func nextClicked(sender: UIButton) {
        increaseStepIndices()
        readDirection()
    }
    
    @IBAction func previousClicked(sender: UIButton) {
        decreaseStepIndices()
        readDirection()
    }
    
    func decreaseStepIndices() {
        isEnd = false
        if currentStep > 0 {
            isBegin = false
            previousStep -= 1
            currentStep -= 1
            nextStep -= 1
            assignText()
        } else if currentStep == 0 {
            isBegin = true
        }
        
    }
    
    func increaseStepIndices() {
        isBegin = false
        if currentStep < totalSteps - 1 {
            isEnd = false
            nextStep += 1
            currentStep += 1
            previousStep += 1
            assignText()
        } else if currentStep == totalSteps - 1 {
            isEnd = true
        }
        
    }
    
    func assignText() {
        // If reach end
        if nextStep == totalSteps {
            nexStep.text = ""
            currStep.text = allDirections[currentStep]
            prevStep.text = allDirections[previousStep]
        }
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
    
    func readDirection() {
        print("read")
        if (allDirections[currentStep] != "DONE") && (allDirections[currentStep] != "BEGIN") {
            let speechUtterance = AVSpeechUtterance(string: allDirections[currentStep])
            speechUtterance.preUtteranceDelay = 0.15
            speechSynthesizer.speakUtterance(speechUtterance)
        }
        
    }
    
    
    
}
