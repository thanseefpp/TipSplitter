//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by THANSEEF on 07/02/22.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    
    var resultStore : String?
    var message : String?
    
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var calculateSettingsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        totalLabel.text = resultStore
        calculateSettingsLabel.text = message
    }

    @IBAction func recalculateButtonPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil) // go back to our first screen
    }
}
