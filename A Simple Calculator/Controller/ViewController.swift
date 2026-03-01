//
//  ViewController.swift
//  A Simple Calculator
//
//  Created by Kensei on 2026-02-28.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var displayLabel: UILabel!
    private var isFinishTyping: Bool = true
    private var displayValue: Double {
        get {
            guard let number = Double(displayLabel.text!)
            else {
                fatalError("Cannot convert display label text to Double.")
            }
            return number
        }
        set {
            displayLabel.text = String(newValue)
        }
    }
    
    private var calculator = CalculatorLogic()
    
    @IBAction func acPressed(_ sender: UIButton) {
        isFinishTyping = true
        displayValue = calculator.performAC()
    }
    
    @IBAction func plusMinusPressed(_ sender: UIButton) {
        calculator.setNumber(displayValue)
        isFinishTyping = true
        guard let result = calculator.performPlusMinus() else { fatalError("Err Calculating +/-")}
        displayValue = result
    }
    
    @IBAction func percPressed(_ sender: UIButton) {
        calculator.setNumber(displayValue)
        isFinishTyping = true
        guard let result = calculator.performPercent() else { fatalError("Err Calculating %")}
        displayValue = result
    }
    
    @IBAction func calcPressed(_ sender: UIButton) {
        calculator.setNumber(displayValue)
        isFinishTyping = true
        guard let operation = sender.accessibilityIdentifier else { fatalError("Yikes") }
        guard let result = calculator.calculate(function: operation) else {return}
        displayValue = result
    }
    
    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        
        if let numValue = sender.titleLabel?.text {
            if isFinishTyping {
                displayLabel.text = numValue
                isFinishTyping = false
            }
            else {
                if numValue == "." {
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

