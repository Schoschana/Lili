//
//  CreateEmployeeController.swift
//  Intermediate
//
//  Created by Lili on 25/07/2019.
//  Copyright © 2019 Lili. All rights reserved.
//

import UIKit
class CreateEmployeeController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Create Employee"
        
        setupCancelButton()
        
        view.backgroundColor = .darkBlue
        
        setupLightBlueBackgroundView(height: 50)
    }
}
