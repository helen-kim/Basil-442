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
    var isPaused: Bool = false
    let emptyString: Int = -1
    var totalSteps: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        recipeTitle.text = stepViewModel!.name()
        allDirections = stepViewModel!.directions()
        prevStep.text = ""
        currStep.text = allDirections[currentStep]
        nexStep.text = allDirections[nextStep]
        totalSteps = allDirections.count
        readDirection()
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
    @IBOutlet weak var suppRepeatButton: UIButton!
    @IBOutlet weak var doneButton: UIButton!
    
    @IBAction func repeatClicked(sender: UIButton) {
        if speechSynthesizer.paused {
            speechSynthesizer.continueSpeaking()
        }
        else if speechSynthesizer.speaking {
            speechSynthesizer.pauseSpeakingAtBoundary(AVSpeechBoundary.Immediate)
        } else if speechSynthesizer.speaking == false{
            readDirection()
        }
    }
    
    @IBAction func finishClicked(sender: UIButton) {
        speechSynthesizer.stopSpeakingAtBoundary(AVSpeechBoundary.Immediate)
    }
    
    @IBAction func nextClicked(sender: UIButton) {
        increaseStepIndices()
        readDirection()
        toggleDone()
    }
    
    @IBAction func previousClicked(sender: UIButton) {
        decreaseStepIndices()
        readDirection()
        toggleDone()
    }
    
    @IBAction func swipeOut(sender: UISwipeGestureRecognizer) {
        speechSynthesizer.stopSpeakingAtBoundary(AVSpeechBoundary.Immediate)
        self.performSegueWithIdentifier("unwindToDir", sender: self)
    }
    
    @IBAction func backToDir(sender: UIButton) {
        speechSynthesizer.stopSpeakingAtBoundary(AVSpeechBoundary.Immediate)
        self.performSegueWithIdentifier("unwindToDir", sender: self)
    }
    
    
    func toggleDone() {
        if (nextStep == totalSteps) {
            doneButton.userInteractionEnabled = true
            doneButton.hidden = false
            doneButton.setTitle("Finished!", forState: UIControlState.Normal)
            nextButton.userInteractionEnabled = false
            nextButton.hidden = true
        } else {
            doneButton.userInteractionEnabled = false
//            doneButton.setTitle("", forState: UIControlState.Normal)
            doneButton.hidden = true
            nextButton.userInteractionEnabled = true
            nextButton.hidden = false
        }
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
        print(currentStep)
        print(nextStep)
        print(previousStep)
        // If reach end
        if nextStep == totalSteps{
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
            print(allDirections)
            print(allDirections[currentStep])
            currStep.text = "second"
            prevStep.text = allDirections[previousStep]
            nexStep.text = allDirections[nextStep]
        }
        isSpeechStopped = speechSynthesizer.stopSpeakingAtBoundary(AVSpeechBoundary.Immediate)
        
    }
    
    func readDirection() {
        let speechUtterance = AVSpeechUtterance(string: allDirections[currentStep])
        speechUtterance.preUtteranceDelay = 0.05
        speechSynthesizer.speakUtterance(speechUtterance)
    }
    
    
    
}
