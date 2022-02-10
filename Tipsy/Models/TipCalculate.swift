//
//  TipCalculate.swift
//  Tipsy
//
//  Created by THANSEEF on 07/02/22.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import UIKit

struct TipCalculate {
    
    var percentage = 0.0
    var splitNumberOfPeople = 2
    var billAmount = 0.0
    var finalResult : String?
    
    mutating func getTipValue(buttonPressed:String){
        let tipValue = String(buttonPressed.dropLast()) // this will remove the last element from the variable
        percentage = Double(tipValue)! / 100.0
    }
    
    mutating func getSplitNumber(number:Int){
        splitNumberOfPeople = number
    }
    mutating func getBillAmount(userAmount:Double){
        billAmount = userAmount
        //Multiply the bill by the tip percentage and divide by the number of people to split the bill.
        let tipAmount = billAmount * (1 + percentage) / Double(splitNumberOfPeople)
        finalResult = String(format: "%.2f", tipAmount)
    }
    
    func getResult()-> String {
        return finalResult ?? "0.0"
    }
    
    func getResultLabel(splitNumber:String,tip:String)-> String{
        return "Split Between \(splitNumber) people with \(tip) tip"
    }
}
