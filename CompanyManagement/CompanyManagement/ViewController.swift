//
//  ViewController.swift
//  CompanyManagement
//
//  Created by Emin Saygı on 17.11.2022.
//

import UIKit

class ViewController: UIViewController {

    var income = 0
    var expense = 0
    var isActive = false
    
    @IBOutlet weak var companyOverview: UILabel!
    @IBOutlet weak var companyTitle: UILabel!
    @IBOutlet weak var imageLogo: UIImageView!
    @IBOutlet weak var moneyTextFiled: UITextField!
    
    @IBOutlet weak var salariesButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        
    }

    func alertFunc(title: String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }

    @IBAction func IncomeClickButton(_ sender: Any) {

           let income = Int(moneyTextFiled.text!)
        
        alertFunc(title: "Information", message: "Added income information")
        moneyTextFiled.text=""
        
           
       }
       @IBAction func EpenseClickButton(_ sender: Any) {
           let expense = Int(moneyTextFiled.text!)
           
           alertFunc(title: "Information", message: "Added epense information")
           moneyTextFiled.text=""
           
         
       }
       
       @IBAction func salariesClickButton(_ sender: Any) {
           let salaries = Int(moneyTextFiled.text!)
           salariesButton.setTitle("Employees' salaries paid", for: UIControl.State.normal)
           salariesButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 12)
           alertFunc(title: "Information", message: "Employees' salaries paid")

           salariesButton.isEnabled = isActive
          
       }
    
    @IBAction func addEmployeeClickedButton(_ sender: Any) {
        performSegue(withIdentifier: "toAddEmployeeVC", sender: nil)
    }
    
    @IBAction func listEmployeeClickedButton(_ sender: Any) {
        performSegue(withIdentifier: "toListEmployeeVC", sender: nil)
    }
}

