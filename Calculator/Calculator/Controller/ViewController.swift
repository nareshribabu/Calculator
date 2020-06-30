//
//  ViewController.swift
//  Calculator
//  Created by Nareshri Babu on 2020-05-01.
//  Concept by London App Brewery
//  Copyright © 2020 Nareshri Babu. All rights reserved.
//  This app was created for learning purposes.
//  All images were only used for learning purposes and do not belong to me.
//  All sounds were only used for learning purposes and do not belong to me.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var displayLabel: UILabel!
    
    //this var is only accessible inside this block of code (aka. this class)
    private var isFinishedTypingNumber: Bool = true
    
    private var displayValue: Double {
        get {
            guard let number = Double(displayLabel.text!) else {
                fatalError("Cannot convert display label text to a Double")
            }
            
            return number
        }
        
        set {
            displayLabel.text = String(newValue)
            
        }
    }
    
    //global variable of the CalculatorLogic struct
    private var calculator = CalculatorLogic()
    
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        
        //What should happen when a non-number button is pressed
        isFinishedTypingNumber = true
    
        calculator.setNumber(displayValue)
        
        if let calcMethod = sender.currentTitle {
    
            if let result = calculator.calculate(symbol: calcMethod) {
               displayValue = result
            }
            
        }
                
    }

    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        
        //What should happen when a number is entered into the keypad
        if let numValue =  sender.currentTitle {
            
            if isFinishedTypingNumber == true {
                displayLabel.text = numValue
                isFinishedTypingNumber = false
            }
            else {
                
                if numValue == "." {
                    
                    //does not allow for more than one decimal number

                    let isInt = floor(displayValue) == displayValue
                    
                    if !isInt {
                       return
                    }
                    
                }
                displayLabel.text = displayLabel.text! + numValue
            }
        }
    }
}

