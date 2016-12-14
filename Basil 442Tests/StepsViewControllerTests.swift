//
//  StepsViewControllerTests.swift
//  Basil 442
//
//  Created by Sophie Zhao on 12/14/16.
//  Copyright © 2016 team danko_. All rights reserved.
//

import XCTest
@testable import Basil_442

class StepsViewControllerTests: XCTestCase {
    
    var testVC: StepsViewController! = StepsViewController()
    
    override func setUp() {
        super.setUp()
        self.testVC = StepsViewController()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testInitialization(){
        //Test values start off as nil
        XCTAssertEqual(self.testVC.allDirections, [])
        XCTAssertEqual(self.testVC.currentStep, 0)
        XCTAssertEqual(self.testVC.nextStep, 1)
        XCTAssertEqual(self.testVC.previousStep, -1)
        XCTAssertEqual(self.testVC.totalSteps, 0)

    }
    
    func test_decreaseStepIndices() {
        self.testVC.decreaseStepIndices()
        XCTAssertEqual(self.testVC.currentStep, 0)
        XCTAssertEqual(self.testVC.nextStep, 1)
        XCTAssertEqual(self.testVC.previousStep, -1)
        
        self.testVC.currentStep = 2
        self.testVC.nextStep = 3
        self.testVC.previousStep = 1
        
        self.testVC.decreaseStepIndices()
        XCTAssertEqual(self.testVC.currentStep, 1)
        XCTAssertEqual(self.testVC.nextStep, 2)
        XCTAssertEqual(self.testVC.previousStep, 0)
        
    }
    
    func test_increaseStepIndices() {
        self.testVC.currentStep = 2
        self.testVC.nextStep = 3
        self.testVC.previousStep = 1
        
        self.testVC.increaseStepIndices()
        XCTAssertEqual(self.testVC.currentStep, 3)
        XCTAssertEqual(self.testVC.nextStep, 4)
        XCTAssertEqual(self.testVC.previousStep, 2)
    }
    
    func test_assignText() {
        self.testVC.currentStep = 2
        self.testVC.nextStep = 3
        self.testVC.previousStep = 1
    
        self.testVC.allDirections = ["first", "second", "third", "fourth"]
        self.testVC.assignText()
        
        XCTAssertEqual(self.testVC.currStep.text, "third")
        XCTAssertEqual(self.testVC.nexStep.text, "fourth")
        XCTAssertEqual(self.testVC.prevStep.text, "second")
        
    }

}