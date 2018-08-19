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
            //forced unwrapping, I know it's an int, the delegate method only allows numbers
            //and I know the values exist because of the if statement we're in
            //but maybe it could be cleaned up more?
            let bmi = getBMI(height: Int(heightTextField.text!)!, weight: Int(weightTextField.text!)!)
            //TODO: don't access another VCs IBObjects https://stackoverflow.com/questions/28344336/how-to-access-an-iboutlet-from-another-class
            vc.view.backgroundColor = .blue //the next 2 lines will crash if I don't have this?
            vc.bmiDescriptionDisplay.text = BMI.getDescription(bmi: bmi)
            vc.bmiNumberDisplay.text = String(bmi)
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
        //TODO: make this look better (text bigger!), indicate which textField needs info
        displayInfoToUser.text = "hey there, enter some info"
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
}

