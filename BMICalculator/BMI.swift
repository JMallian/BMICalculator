//
//  BMI.swift
//  BMICalculator
//
//  Created by Jessica Mallian on 8/19/18.
//  Copyright © 2018 Jessica Mallian. All rights reserved.
//

import UIKit

class BMI: NSObject {
    let bmi: Double
    
    init(bmi: Double) {
        self.bmi = bmi
    }
    
    func getDescription(bmi: Double) -> String {
        if bmi <= 15.0 {
            return "Very Severely Underweight"
        }else if bmi <= 16.0 {
            return "Severely Underweight"
        }else if bmi <= 18.5 {
            return "Underweight"
        }else if bmi <= 25 {
            return "Normal (healthy weight)"
        }else if bmi <= 30 {
            return "Overweight"
        }else if bmi <= 35 {
            return "Obese Class I (moderately obese)"
        }else if bmi <= 40 {
            return "Obese Class II (severely obese)"
        }else if bmi <= 45 {
            return "Obese Class III (very severely obese)"
        }else if bmi <= 50 {
            return "Obese Class IV (morbidly obese)"
        }else if bmi <= 60 {
            return "Obese Class V (super obese)"
        }else{
            return "Obese Class VI (hyper obese)"
        }
    }
}
