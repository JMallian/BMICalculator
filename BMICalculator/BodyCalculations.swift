//
//  BodyCalculations.swift
//  BMICalculator
//
//  Created by Jessica Mallian on 8/13/18.
//  Copyright © 2018 Jessica Mallian. All rights reserved.
//

import Foundation

class BodyCalculations {
    //TODO: probably a bunch of static methods, write tests!
    static func getBMI(heightInInches height: Int, weightInPounds weight: Int) -> Double {
        return (Double(height/weight)) * 703
    }
    
    static func getBMI(heightInCentimeters height: Int, weightInKilograms weight: Int) -> Double {
        return 2
    }
    
    static func getBMI(heightInInches height: Int, weightInKilograms weight: Int) -> Double {
        return 2
    }
    
    static func getBMI(heightInCentimeters height: Int, weightInPounds weight: Int) -> Double {
        return 2
    }
}
