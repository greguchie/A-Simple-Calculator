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
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        isFinishTyping = true
        
        guard let number = Double(displayLabel.text!)
        else {
            fatalError("Cannot convert display label text to Double.")
        }
        
        // when a non-number is pressed
    }
    
    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        if let numValue = sender.titleLabel?.text {
            if isFinishTyping {
                displayLabel.text = numValue
                isFinishTyping = false
            }
            else {
                displayLabel.text = displayLabel.text! + numValue
            }
            
        }
    }
    
    
}

