//
//  AddEmployeeViewController.swift
//  CompanyManagement
//
//  Created by Emin Saygı on 17.11.2022.
//

import UIKit
import CoreData

class AddEmployeeViewController: UIViewController {
    
    @IBOutlet weak var salaryLabel: UILabel!
    @IBOutlet weak var nameTextFiled: UITextField!
    @IBOutlet weak var maritalStatusTextFiled: UITextField!
    @IBOutlet weak var experienceTextFiled: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    
    var name = ""
    var age = ""
    var experience = ""
    var maritalStatus = ""
    
    let experienceArray = ["Junior","Medium","Senior"]
    let ageArray = [18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65]
    let maritalStatusArray = ["Married","Single"]
    
    var maritalStatusPicker = UIPickerView()
    var experiencePicker = UIPickerView()
    var agePicker = UIPickerView()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        maritalStatusTextFiled.inputView = maritalStatusPicker
        experienceTextFiled.inputView = experiencePicker
        ageTextField.inputView = agePicker
        
        maritalStatusTextFiled.placeholder = "Select Marital Status"
        experienceTextFiled.placeholder = "Select Experience"
        ageTextField.placeholder = "Select Age"
        
        maritalStatusTextFiled.textAlignment = .center
        experienceTextFiled.textAlignment = .center
        ageTextField.textAlignment = .center
        
         maritalStatusPicker.delegate = self
         maritalStatusPicker.dataSource = self
         experiencePicker.delegate = self
         experiencePicker.dataSource = self
         agePicker.delegate = self
         agePicker.dataSource = self
         
        experiencePicker.tag = 1
        agePicker.tag = 2
        maritalStatusPicker.tag = 3
        
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func calculateSalaryButtonClicked(_ sender: Any) {
        
        switch experienceTextFiled.text {
        case "Junior":
            salaryLabel.text = String(1000*20)
        case "Medium":
            salaryLabel.text = String(1500*22)
        case "Senior":
            salaryLabel.text = String(2000*24)
        default:
            "0"
        }
    }
   
 
    
    @IBAction func addEmployeeClickedButton(_ sender: Any) {
        name = nameTextFiled.text ?? "Emin"
        age = ageTextField.text ?? "20"
        experience = experienceTextFiled.text ?? "Junior"
        maritalStatus = maritalStatusTextFiled.text ?? "Single"
        
        
      performSegue(withIdentifier: "listVC", sender: nil)

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       
            let destination = segue.destination as! ListEmployeeViewController
            destination.name = name
            destination.age = String(age)
            destination.experience = experience
            destination.maritalStatus = maritalStatus
            
        
    }
   

    
    
}

extension AddEmployeeViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
     
        switch pickerView.tag {
        case 1:
            return experienceArray.count
        case 2:
            return ageArray.count
        case 3:
            return maritalStatusArray.count
        default:
            return 1
        }
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView.tag {
       case 1:
           return experienceArray[row]
       case 2:
           return String(ageArray[row])
       case 3:
           return maritalStatusArray[row]
       default:
           return "Data not found"
       }
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch pickerView.tag {
       case 1:
            experienceTextFiled.text = experienceArray[row]
            experienceTextFiled.resignFirstResponder()
            
       case 2:
            ageTextField.text = String(ageArray[row])
            ageTextField.resignFirstResponder()


       case 3:
            maritalStatusTextFiled.text = maritalStatusArray[row]
            maritalStatusTextFiled.resignFirstResponder()


       default:
           return
       }
    }
    
    
}
