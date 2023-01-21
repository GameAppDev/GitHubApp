//
//  CoreDataManager.swift
//  GitHubApp
//
//  Created by Oguzhan Yalcin on 21.01.2023.
//

import Foundation
import CoreData

final class CoreDataManager {
    
    public static let shared = CoreDataManager()
}

extension CoreDataManager {
    
    var managedContext: NSManagedObjectContext {
        return appDelegate.persistentContainer.viewContext
    }
    
    var fetchRequest: NSFetchRequest<NSFetchRequestResult> {
        return NSFetchRequest<NSFetchRequestResult>(entityName: "Repositories")
    }
}
