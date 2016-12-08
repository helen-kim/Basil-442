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
        allDirections = stepViewModel!.directions()
        prevStep.text = ""
        currStep.text = allDirections[currentStep]
        nexStep.text = allDirections[nextStep]
        totalSteps = allDirections.count
        readDirection()
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
        readDirection()
    }
    
    @IBAction func finishClicked(sender: UIButton) {
        speechSynthesizer.stopSpeakingAtBoundary(AVSpeechBoundary.Immediate)
    }
    
    @IBAction func nextClicked(sender: UIButton) {
        toggleDone()
        increaseStepIndices()
        readDirection()
    }
    
    @IBAction func previousClicked(sender: UIButton) {
        decreaseStepIndices()
        readDirection()
        toggleDone()
    }
    
    func toggleDone() {
        print("prev step: (\(previousStep)) \(prevStep.text), current step: (\(currentStep)) \(currStep.text), next step: (\(nextStep)) \(nexStep.text)")
        if (nextStep+1 == totalSteps) {
            doneButton.userInteractionEnabled = true
            doneButton.setTitle("Finished!", forState: UIControlState.Normal)
            nextButton.userInteractionEnabled = false
            nextButton.hidden = true
        } else {
            doneButton.userInteractionEnabled = false
            doneButton.setTitle("", forState: UIControlState.Normal)
            nextButton.userInteractionEnabled = true
            nextButton.hidden = false
        }
    }
    
    func decreaseStepIndices() {
//        print("previous")
//        if currentStep == 0 && previousStep == -1{
//            isBegin = true
//        }
//        
//        if currentStep > 0 {
//            if isBegin {
//                isBegin = false
//            }
//            currentStep = currentStep - 1
//        }
//        
//        // Increment next only if current step is not at the top
//        if currentStep == 0 {
//            nextStep = nextStep - 1
//            previousStep = emptyString
//        } else {
//            nextStep = currentStep + 1
//            // Increment previous as 1 less than current
//            previousStep = currentStep - 1
//        }
//        if isBegin == false {
//            assignText()
//        }
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
//        print("next")
//        // directions done if currentStep is past last step
//        if currentStep == allDirections.count + 1{
//            isEnd = true
//        }
//        if currentStep < allDirections.count + 1{
//            if isEnd {
//                isEnd = false
//            }
//            currentStep = currentStep + 1
//        }
//        
//        // Increment next only if current step is not at the bottom
//        if currentStep == allDirections.count {
//            nextStep = 0
//            previousStep = currentStep - 1
//        } else {
//            print("nextstep")
//            nextStep = nextStep + 1
//            // Increment previous as 1 less than current
//            previousStep = currentStep - 1
//        }
//        if isEnd == false {
//            assignText()
//        }
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
        let speechUtterance = AVSpeechUtterance(string: allDirections[currentStep])
        speechUtterance.preUtteranceDelay = 0.05
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
