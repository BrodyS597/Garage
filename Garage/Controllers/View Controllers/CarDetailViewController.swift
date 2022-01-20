//
//  CarDetailViewController.swift
//  Garage
//
//  Created by Brody Sears on 1/19/22.
//

import UIKit

class CarDetailViewController: UIViewController {
    
    //IBOutlets
    @IBOutlet weak var makeTextField: UITextField!
    @IBOutlet weak var modelTextField: UITextField!
    @IBOutlet weak var yearTextField: UITextField!
   // @IBOutlet weak var carTypePicker: UIPickerView! //(sender.tag)
    
    // MARK: - Properties
    var car: Car? = nil
    
    // MARK: - LifeCyle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        guard let car = car else { return }
        updateUI(car: car)
    }
    
    //IBActions
    @IBAction func saveButtonTapped(_ sender: Any) {
        guard let make = makeTextField.text, !make.isEmpty,
              let model = modelTextField.text,!model.isEmpty,
              let yearString = yearTextField.text, !yearString.isEmpty,
              let year = Int(yearString)
        else { return }
        
        //the car exists, we're updating it
        if let car = car {
            CarController.sharedInstance.updateCar(car: car, make: make, model: model, year: year, defaultImage: .none)
        }
        //the car doesnt exist, lets make a new one with the details
        else {
            CarController.sharedInstance.createCar(make: make, model: model, year: year, defaultImage: .none)
        }
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func clearButtonTapped(_ sender: Any) {
        makeTextField.text = ""
        modelTextField.text = ""
        yearTextField.text = ""
    }
    
    @IBAction func deleteButtonTapped(_ sender: Any) {
        if let car = car {
            CarController.sharedInstance.deleteCar(car: car)
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    
    // MARK: - Helper Functions
    func updateUI(car: Car) {
        makeTextField.text = car.make
        modelTextField.text = car.make
        yearTextField.text = "\(car.year)"
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
