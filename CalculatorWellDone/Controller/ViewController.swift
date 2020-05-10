//
//  ViewController.swift
//  CalculatorWellDone
//
//  Created by Saul Rivera on 03/05/20.
//  Copyright © 2020 Saul Rivera. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var displayLabel: UILabel!
    
    private var isFinishedTypingNumber: Bool = true
    private var displayValue: Double {
        get {
            guard let number = Double(displayLabel.text!) else {
                fatalError("Cannot convert display label to a number")
            }
            return number
        }
        set {
            let displayValueString = String(newValue)
            displayLabel.text = displayValueString
        }
    }
    
    private let calculationLogic = CalculationLogic()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func calcButtonPressed(_ sender: UIButton) {
        if let operation = sender.currentTitle {
            if let result = calculationLogic.calculate(operation, to: displayValue) {
                displayValue = result
            } else {
                fatalError("Cannot compute the result")
            }
        }
        isFinishedTypingNumber = true
    }
    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        if let numValue = sender.currentTitle {
            if isFinishedTypingNumber {
                if sender.currentTitle! == "." {
                    displayLabel.text = "0."
                } else {
                    displayLabel.text = numValue
                }
                isFinishedTypingNumber = false
            } else {
                if sender.currentTitle! == "." && displayLabel.text!.contains(".") {
                    return
                }
                displayLabel.text = displayLabel.text! + numValue
            }
        }
    }
}

