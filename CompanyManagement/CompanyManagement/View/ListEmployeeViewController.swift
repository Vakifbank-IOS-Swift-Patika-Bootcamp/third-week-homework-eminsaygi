//
//  ListEmployeeViewController.swift
//  CompanyManagement
//
//  Created by Emin Saygı on 17.11.2022.
//

import UIKit



class ListEmployeeViewController: UIViewController  {

    
    var name = ""
    var age = ""
    var experience = ""
    var maritalStatus = ""
    
    var nameArray = [String]()
    var ageArray = [String]()
    var experienceArray = [String]()
    var maritalStatusArray = [String]()
    
    @IBOutlet weak var employeeTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        employeeTableView.dataSource = self
        employeeTableView.delegate = self
        
        searchController()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        nameArray.append(name)
        ageArray.append(age)
        experienceArray.append(experience)
        maritalStatus.append(maritalStatus)
        
        employeeTableView.reloadData()
    }
    

   
}

extension ListEmployeeViewController : UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nameArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = employeeTableView.dequeueReusableCell(withIdentifier: "employeeCell", for: indexPath)
        cell.textLabel?.text = "Name: \(nameArray[indexPath.row]) | Age: \(ageArray[indexPath.row]) | Experience: \(experienceArray[indexPath.row]) "
        return cell
    }
    
    
}

extension ListEmployeeViewController: UISearchResultsUpdating{
    
    private func searchController(){
        let search = UISearchController(searchResultsController: nil)
        search.searchResultsUpdater = self
        search.obscuresBackgroundDuringPresentation = false
        search.searchBar.placeholder = "Type something here to search employee"
        navigationItem.searchController = search
        
        
    }
    
    
    
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else { return }
        
        
    }
    
}
