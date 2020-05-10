//
//  CalculationLogic.swift
//  CalculatorWellDone
//
//  Created by Saul Rivera on 09/05/20.
//  Copyright © 2020 Saul Rivera. All rights reserved.
//

import Foundation

struct CalculationLogic {
    private var number: Double?
    private var intermediateCalculation: (number: Double, operation: String)?
    
    mutating func setNumber(_ number: Double) {
        self.number = number
    }
    
    mutating func calculate(_ operation: String, to value: Double) -> Double? {
        switch operation {
        case "AC":
            return 0
        case "+/-":
            return value * -1
        case "%":
            return value / 100
        case "=":
            return performCalculation(n2: value)
        default:
            intermediateCalculation = (number: value, operation: operation)
            return nil
        }
    }
    
    private func performCalculation(n2: Double) -> Double? {
        if let n1 = intermediateCalculation?.number,
            let operation = intermediateCalculation?.operation {
            switch operation {
            case "+":
                return n1 + n2
            case "-":
                return n1 - n2
            case "x":
                return n1 * n2
            case "/":
                return n1 / n2
            default:
                fatalError("Any of the operation support")
            }
        }
        return nil
    }
}
