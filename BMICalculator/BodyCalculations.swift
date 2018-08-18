//
//  BodyCalculations.swift
//  BMICalculator
//
//  Created by Jessica Mallian on 8/13/18.
//  Copyright © 2018 Jessica Mallian. All rights reserved.
//

import Foundation

class BodyCalculations {

    static func getBMI(heightInInches height: Int, weightInPounds weight: Int) -> Double {
        let result = (Double(weight) / Double(height * height)) * 703.0
        return (result*10).rounded()/10
    }
    
    static func getBMI(heightInCentimeters height: Int, weightInKilograms weight: Int) -> Double {
        var height = Double(height)
        let weight = Double(weight)
        height = height/100 //centimeters to meters
        let result = weight / (height * height)
        return (result*10).rounded()/10
    }
    
    static func getBMI(heightInInches height: Int, weightInKilograms weight: Int) -> Double {
        var height = Double(height)
        let weight = Double(weight)
        height = height * 0.0254 //inches to meters
        let result = weight / (height * height)
        return (result*10).rounded()/10
    }
    
    static func getBMI(heightInCentimeters height: Int, weightInPounds weight: Int) -> Double {
        var height = Double(height)
        var weight = Double(weight)
        weight = weight * 0.4535924 //lbs to kg
        height = height/100 //centimeters to meters 
        let result = weight / (height * height)
        return (result*10).rounded()/10
    }
}
