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
}
