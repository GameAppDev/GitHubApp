//
//  CoreDataManager.swift
//  GitHubApp
//
//  Created by Oguzhan Yalcin on 21.01.2023.
//

import UIKit
import CoreData

final class CoreDataManager {
    
    public static let shared = CoreDataManager()
    
    public func getFavouriteRepos() -> [CustomRepositoryModel] {
        var fetchedRepositories: [Repository] = []
        
        do { fetchedRepositories = try managedContext.fetch(fetchRequestForRepository) }
        catch let error { debugPrint("<---! Get Fav Repos Error: \(error.localizedDescription) !--->") }
        
        let repositories: [CustomRepositoryModel] = fetchedRepositories.map({ repo in
            CustomRepositoryModel(coreDataModel: repo)
        })
        
        return repositories
    }
    
    public func addRepoToFav(_ repo: CustomRepositoryModel) {
        guard let entity = NSEntityDescription.entity(forEntityName: "Repository", in: managedContext) else { return }
        
        let item = NSManagedObject(entity: entity, insertInto: managedContext)
        item.setValue(repo.avatarUrl, forKey: "avatarUrl")
        item.setValue(repo.createdAt, forKey: "createdAt")
        item.setValue(repo.description, forKey: "desc")
        item.setValue(repo.fullName, forKey: "fullName")
        item.setValue(repo.id, forKey: "id")
        item.setValue(repo.language, forKey: "language")
        item.setValue(repo.licenseUrl, forKey: "licenseUrl")
        item.setValue(repo.pushedAt, forKey: "pushedAt")
        item.setValue(repo.reposUrl, forKey: "reposUrl")
        item.setValue(repo.updatedAt, forKey: "updatedAt")
        item.setValue(repo.visibilityStatus.rawValue, forKey: "visibilityStatusRawValue")
        item.setValue(repo.watchersCount, forKey: "watchersCount")
        
        self.saveContext()
    }
    
    private func saveContext() {
        guard managedContext.hasChanges else { return }
        
        do { try managedContext.save() }
        catch let error { debugPrint("<---! Save Fav Repo Error: \(error.localizedDescription) !--->") }
    }
}

extension CoreDataManager {
    
    var managedContext: NSManagedObjectContext {
        return (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    }
    
    var fetchRequestForRepository: NSFetchRequest<Repository> {
        return Repository.fetchRequest()
        //return NSFetchRequest<Repository>(entityName: "Repository")
    }
}
