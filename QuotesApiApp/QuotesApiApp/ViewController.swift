//
//  ViewController.swift
//  QuotesApiApp
//
//  Created by Emin Saygı on 20.11.2022.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var infLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
   
        }


    @IBAction func getRandomTouchUpButton(_ sender: Any) {
        getMovieData()
    }
}


extension ViewController {
    
    func getMovieData() {
        WebService.shared.getMovie() {  result in
            
            switch result {
            case .success(let data):
                
                DispatchQueue.main.async {
                    self.infLabel.text = " Id= \(data.id) \n\n Author= \(data.author) \n\n En= \(data.en)"
                    
                }
                
            case.failure(_):
                print("Catch")
            }
        }
    }
}
