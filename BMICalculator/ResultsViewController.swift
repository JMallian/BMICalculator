//
//  ResultsViewController.swift
//  BMICalculator
//
//  Created by Jessica Mallian on 8/15/18.
//  Copyright © 2018 Jessica Mallian. All rights reserved.
//

import UIKit
class ResultsViewController: UIViewController {
    @IBOutlet weak var bmiNumberDisplay: UILabel!
    @IBOutlet weak var bmiDescriptionDisplay: UILabel!
    var bmi: BMI?
    
    override func viewDidLoad() {
        if let model = self.bmi {
            bmiNumberDisplay.text = String(model.bmi)
            bmiDescriptionDisplay.text = model.getDescription(bmi: model.bmi)
        }
    }
}
