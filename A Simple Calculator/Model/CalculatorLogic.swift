//
//  CalculatorLogic.swift
//  A Simple Calculator
//
//  Created by Kensei on 2026-03-01.
//

import Foundation

struct CalculatorLogic {
    private var number: Double?
    private var intermediateCalculation: (n1:Double, operation:String)?
    
    mutating func setNumber(_ number: Double) {
        self.number = number
    }
    
    func performAC() -> Double {
        return 0
    }
    
    func performPlusMinus() -> Double? {
        if let safenum = number {
            return -safenum
        }
        return nil
    }
    
    func performPercent() -> Double? {
        if let safenum = number {
            return safenum/100
        }
        return nil
    }
    
    mutating func calculate(function: String) -> Double? {
        if let n = number {
            if function == "equals"{
                return performTwoNumCalc(n2: n)
            }
            else {
                intermediateCalculation = (n1: n, operation: function)
            }
        }
        return nil
    }
    
    private func performTwoNumCalc(n2: Double) -> Double? {
        if let n1 = intermediateCalculation?.n1, let operation = intermediateCalculation?.operation {
            switch operation {
            case "plus":
                return n1 + n2
            case "minus":
                return n1 - n2
            case "divide":
                return n1 / n2
            case "times":
                return n1 * n2
            default:
                fatalError("operation doesnt exist")
            }
        }
        return nil
    }
}
