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
    @IBOutlet weak var displayInfoToUser: UILabel!
    
    let heightPlaceholderText = "height in inches or centimeters"
    let weightPlaceholderText = "weight in lbs or kilograms"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDelegates()
        setupKeyboards()
        setupPlaceholderText()
        setupTitlesForSegmentedControls()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        clearLabelsAndTextFields()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK calculate button methods
    @IBAction func calculateButtonPressed(_ sender: Any) {
        if(bothTextFieldsHaveInput()) {
            let vc = storyboard?.instantiateViewController(withIdentifier: "ResultsVC") as! ResultsViewController
            let bmi = getBMI(height: Int(heightTextField.text!)!, weight: Int(weightTextField.text!)!)
            let model = BMI(bmi: bmi)
            vc.bmi = model
            if let navigationController = navigationController {
                navigationController.pushViewController(vc, animated: true)
            }
        }else{
            tellUserToEnterInput()
        }
    }
    
    func bothTextFieldsHaveInput() -> Bool {
        return (heightTextField.text != "" && weightTextField.text != "")
    }
    
    func tellUserToEnterInput() {
        var message = ""
        if(heightTextField.text == "" && weightTextField.text == "") {
            message = "Please enter a height and weight."
        }else if(heightTextField.text == "") {
            message = "Please enter a height."
        }else{
            message = "Please enter a weight"
        }
        displayInfoToUser.text = message
    }
    

    //MARK: UITextFieldDelegate methods
    //keyboard will disappear when Return is pressed
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.text = ""
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
        weightTextField.placeholder = weightPlaceholderText
        heightTextField.placeholder = heightPlaceholderText
    }
    
    func setupTitlesForSegmentedControls() {
        heightSegmentedControl.setTitle("Imperial", forSegmentAt: 0)
        heightSegmentedControl.setTitle("Metric", forSegmentAt: 1)
        weightSegmentedControl.setTitle("Imperial", forSegmentAt: 0)
        weightSegmentedControl.setTitle("Metric", forSegmentAt: 1)
    }
    
    func clearLabelsAndTextFields() {
        weightTextField.text = ""
        heightTextField.text = ""
        displayInfoToUser.text = "" 
    }

    //MARK: this will figure out which function to call in BodyCalculator, may be temporary
    func getBMI(height: Int, weight: Int) -> Double {
        //see how the segmentedControls are set
        let bmi: Double
        if(heightSegmentedControl.selectedSegmentIndex == 0) {
            if(weightSegmentedControl.selectedSegmentIndex == 0) {
                //height imperial, weight imperial
                bmi = BodyCalculations.getBMI(heightInInches: height, weightInPounds: weight)
            }else{
                //height imperial, weight metric
                bmi = BodyCalculations.getBMI(heightInInches: height, weightInKilograms: weight)
            }
        }else{
            if(weightSegmentedControl.selectedSegmentIndex == 0) {
                //height metric, weight imperial
                bmi = BodyCalculations.getBMI(heightInCentimeters: height, weightInPounds: weight)
            }else{
                //height metric, weight metric
                bmi = BodyCalculations.getBMI(heightInCentimeters: height, weightInKilograms: weight)
            }
        }
        return bmi
    }
    
    //TODO:
    //text could be bigger in UISegmentControlls
    //horizontal orientation doesn't look good
    //different color scheme overall might be nice
    //keyboard comes close to covering lables in horizontal orientation and will cover textfields in horizontal
    //consider using alerts to alert the user to not entering input in a textfield when hitting calculate
    
}

