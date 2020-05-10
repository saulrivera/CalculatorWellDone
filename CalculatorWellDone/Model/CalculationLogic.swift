//
//  CalculationLogic.swift
//  CalculatorWellDone
//
//  Created by Saul Rivera on 09/05/20.
//  Copyright © 2020 Saul Rivera. All rights reserved.
//

import Foundation

class CalculationLogic {
    func calculate(_ operation: String, to value: Double) -> Double? {
            switch operation {
            case "AC":
                return 0
            case "+/-":
                return value * -1
            case "%":
                return value / 100
            default:
                return nil
            }
        }
}
