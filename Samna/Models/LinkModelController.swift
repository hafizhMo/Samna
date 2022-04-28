//
//  LinkModelController.swift
//  Samna
//
//  Created by Hafizh Mo on 28/04/22.
//

import Foundation
import CoreData

class LinkModelController: ObservableObject {
    
    init() {
        let container = NSPersistentContainer(name: "LinkModel")
        container.loadPersistentStores { desc, error in
            if let error = error {
                print("Failed to load the data \(error.localizedDescription)")
            }
        }
    }
    
    func save(context: NSManagedObjectContext) {
        do {
            try context.save()
            print("Data saved!")
        } catch {
            print("We could not save the data...")
        }
    }
}
