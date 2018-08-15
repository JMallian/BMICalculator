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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDelegates()
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
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        //only want user to enter whole numbers
    }
    

    
    //MARK: functions to declutter other functions
    func setupDelegates() {
        self.heightTextField.delegate = self
        self.weightTextField.delegate = self
    }

}

