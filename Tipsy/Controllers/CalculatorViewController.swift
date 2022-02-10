//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    var tipCalculator = TipCalculate()
    var pressedButtonName : String?
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func tipChangeButtonPressed(_ sender: UIButton) {
        
        tenPctButton.isSelected = false // to disable selected button state
        twentyPctButton.isSelected = false
        zeroPctButton.isSelected = false
        sender.isSelected = true
        
        pressedButtonName = sender.currentTitle!
        
        tipCalculator.getTipValue(buttonPressed:pressedButtonName!)
        
        billTextField.endEditing(true) // to hide the keyboard once user click any where except the keyboard.
    }
    
    @IBAction func stepperButtonPressed(_ sender: UIStepper) {
        splitNumberLabel.text = String(format: "%.0f",sender.value)
        tipCalculator.getSplitNumber(number:Int(sender.value))
    }
    
    @IBAction func calculateButtonPressed(_ sender: UIButton) {
        let userInputAmount = billTextField.text!
        if userInputAmount != ""{
            tipCalculator.getBillAmount(userAmount:Double(userInputAmount)!) // it's not beign used but it will make calculation
        }else{
            print("Nothing Found")
        }
        
        performSegue(withIdentifier: "goToResult", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult"{
            let destination = segue.destination as! ResultsViewController
            destination.resultStore = tipCalculator.getResult()
            destination.message = tipCalculator.getResultLabel(splitNumber:splitNumberLabel.text!,tip:pressedButtonName!)
        }
    }
    
    
}

