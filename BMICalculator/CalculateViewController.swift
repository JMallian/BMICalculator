//
//  ViewController.swift
//  BMICalculator
//
//  Created by Jessica Mallian on 8/13/18.
//  Copyright © 2018 Jessica Mallian. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var heightTextField: UITextField!
    @IBOutlet weak var weightTextField: UITextField!
    @IBOutlet weak var heightSegmentedControl: UISegmentedControl!
    @IBOutlet weak var weightSegmentedControl: UISegmentedControl!
    @IBOutlet weak var calculateButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDelegates()
        setupKeyboards()
        setupPlaceholderText()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //MARK: UITextFieldDelegate methods
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        //use this to clear default text the first time user enters something?
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        //only want user to enter whole numbers
        let allowedSet = NSCharacterSet(charactersIn: "0123456789")
        let inputSet = NSCharacterSet(charactersIn: string)
        return allowedSet.isSuperset(of: inputSet as CharacterSet)
    }
    

    
    //MARK: functions to declutter other functions
    func setupDelegates() {
        self.heightTextField.delegate = self
        self.weightTextField.delegate = self
    }
    
    func setupKeyboards() {
        heightTextField.keyboardType = .numbersAndPunctuation
        weightTextField.keyboardType = .numbersAndPunctuation
    }
    
    func setupPlaceholderText() {
        weightTextField.placeholder = "Weight"
        heightTextField.placeholder = "Height"
    }

}

