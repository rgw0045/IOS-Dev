//
//  ViewController.swift
//  Calculator
//
//  Created by Ricky on 3/27/17.
//  Copyright © 2017 Do it BIG Software. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var Display: UILabel!
    var userIsTyping = false
    
    @IBAction func TouchDigit(_ sender: UIButton) {
        let digit = sender.currentTitle!
        if userIsTyping {
            let CurrentText = Display.text!
            Display.text = CurrentText + digit
        } else {
            Display.text = digit
            userIsTyping = true
        }
    }
    
    //legwork to unwrap the display value
    var displayValue: Double {
        get {
            return Double(Display.text!)!
        }
        
        set {
            Display.text = String(newValue)
        }
    }
    
    private var brain = CalculatorBrain()
    
    @IBAction func PerformOperation(_ sender: UIButton) {
        
        if userIsTyping{
            brain.SetOperand(displayValue)
            userIsTyping = false
        }
        
        userIsTyping = false
        if let mathSymbol = sender.currentTitle {
            brain.PerformOperation(mathSymbol)
            
            if let result = brain.result{
                displayValue = result
            }
        }
    }
    
    
}

