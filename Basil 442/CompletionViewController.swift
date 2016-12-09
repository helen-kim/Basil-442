//
//  CompletionViewController.swift
//  Basil 442
//
//  Created by Sophie Zhao on 12/8/16.
//  Copyright © 2016 team danko_. All rights reserved.
//

import UIKit
import AVFoundation

class CompletionViewController: UIViewController {

    let speechSynthesizer = AVSpeechSynthesizer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let speechUtterance = AVSpeechUtterance(string: "Bon Appetit!")
        speechUtterance.voice = AVSpeechSynthesisVoice(language: "fr-CA")
        speechUtterance.preUtteranceDelay = 0.05
        speechSynthesizer.speakUtterance(speechUtterance)
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func goToHome(sender: UIButton) {
        self.performSegueWithIdentifier("unwindToHome", sender: self)
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
