//
//  CompaniesController+CreateCompany.swift
//  Intermediate
//
//  Created by Lili on 25/07/2019.
//  Copyright © 2019 Lili. All rights reserved.
//

import UIKit

extension CompaniesController: CreateCompanyControllerDelegete {
    
    func didEditCompany(company: Company) {
        // update my tableview somehow
        let row = companies.index(of: company)
        let reloadIndexPath = IndexPath(row: row!, section: 0)
        tableView.reloadRows(at: [reloadIndexPath], with: .middle)
    }
    
    
    func didAddCompany(company: Company) {
        companies.append(company)
        let newIndexPath = IndexPath(row: companies.count - 1, section: 0)
        tableView.insertRows(at: [newIndexPath], with: .automatic)
    }
    
    // specify your extension methods here....
    
}
