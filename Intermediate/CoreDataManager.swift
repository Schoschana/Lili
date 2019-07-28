//
//  CoreDataManager.swift
//  Intermediate
//
//  Created by Lili on 05/07/2019.
//  Copyright © 2019 Lili. All rights reserved.
//

import CoreData

struct CoreDataManager {
    static let shared = CoreDataManager () // will live forever as long as your application is still alive, its properties will too
    
    let persistentContainer: NSPersistentContainer = {
        
        let container = NSPersistentContainer(name: "IntermediateModels")
        container.loadPersistentStores { (storeDescription, err) in
            if let err = err {
                fatalError("Loading of store failed: \(err)")
            }
        }
        return container
    }()
    func fetchCompanies() -> [Company] {
        let context = persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<Company>(entityName: "Company")
        do {
            let companies = try context.fetch(fetchRequest)
            
         return companies
            
        } catch let fetchErr {
            print("Failed to fetch companies:", fetchErr)
            return []
        }
    }
    
    func createEmployee (employeeName: String) -> Error? {
        let context = persistentContainer.viewContext
        
    // create an employee
        let employee = NSEntityDescription.insertNewObject(forEntityName: "Employee", into: context)
        employee.setValue(employeeName, forKey: "name")
        do {
            try context.save()
            return nil
        }catch let err {
            return err
            print("Failed to create employee", err)
      }
   }
   
 }
