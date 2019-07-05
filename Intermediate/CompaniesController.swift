//
//  CompaniesController.swift
//  Intermediate
//
//  Created by Lili on 03/07/2019.
//  Copyright © 2019 Lili. All rights reserved.
//

import UIKit
import CoreData


class CompaniesController: UITableViewController, CreateCompanyControllerDelegete {
    func didAddCompany(company: Company) {
        companies.append(company)
        
        // 2- insert a new index path into tableView
        let newIndexPath = IndexPath(row: companies.count - 1, section: 0)
        tableView.insertRows(at: [newIndexPath], with: .automatic)
        
    }
    var companies = [Company]()
    
    // var: variable that can be modified
    
  
 // func addCompany(company: Company) {
     
     //    companies.append(company)
      //  let newIndexPath = IndexPath(row: companies.count - 1, section: 0)
      //   tableView.insertRows(at: [newIndexPath], with: .automatic)
        
   //  }
    
    
    
    private func fetchCompanies(){
        let persistentContainer = NSPersistentContainer(name: "IntermediateModels")
        persistentContainer.loadPersistentStores { (storeDescription, err) in
            if let err = err {
                fatalError("Loading of store failed: \(err)")
                
            }
        }
        
        let context = persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<Company>(entityName: "Company")
        do {
           let companies = try context.fetch(fetchRequest)
            companies.forEach ({ (company) in
                print(company.name ?? "")
            })
            
            
        } catch let fetchErr {
            print("Failed to fetch companies:", fetchErr)
        }
    }
    override func viewDidLoad() {
      super.viewDidLoad()
        fetchCompanies()
       
        //navigationItem.leftBarButtonItem = UIBarButtonItem(title: "TEST ADD", style: .plain, target: self, action: #selector(addCompany))
            
        view.backgroundColor = .white
        
        navigationItem.title = "Companies"
        
        tableView.backgroundColor = UIColor.darkBlue
        // tableView.separatorStyle = .none
        tableView.separatorColor = .white
        tableView.tableFooterView = UIView() // blank UIView
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cellId")
        
        navigationItem.rightBarButtonItem  = UIBarButtonItem(image: #imageLiteral(resourceName: "plus").withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(handleAddCompany))
        
        
        
    }
    @objc func handleAddCompany () {
        print("Adding company..")
        
        let createCompanyController = CreateCompanyController()
        //createCompanyController.view.backgroundColor = .green
        
        let navController = CustomNavigationController(rootViewController: createCompanyController)
        
        createCompanyController.delegate = self
        present(navController, animated: true, completion: nil)
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = .lightBlue
        return view
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath)
        
        cell.backgroundColor = .tealColor
        
        let company = companies[indexPath.row]
        
        cell.textLabel?.text = company.name
        cell.textLabel?.textColor = .white
        
        cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        return cell
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return companies.count
        // return 8 //arbitrary
    }
    
    
}
