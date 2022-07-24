//
//  CoreDataStack.swift
//  TableBased
//
//  Created by admin on 24.07.2022.
//

import Foundation
import CoreData

class CoreDataStack{
    lazy var persistanceContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "TableBased")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    func saveContext() {
        let context = persistanceContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}
