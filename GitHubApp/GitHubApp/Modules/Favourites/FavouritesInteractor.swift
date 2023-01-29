//
//  FavouritesInteractor.swift
//  GitHubApp
//
//  Created by Oguzhan Yalcin on 28.01.2023.
//

import Foundation

final class FavouritesInteractor {
    
    weak var presenter: PFavouritesInteractorToPresenter?
    
    private var repositories = [CustomRepositoryModel]()
}

extension FavouritesInteractor: PFavouritesPresenterToInteractor {
    
    // MARK: - Fetch
    func fetchData<T>(request: T) {
        self.repositories = CoreDataManager.shared.getFavouriteRepos()
        presenter?.setData(data: self.repositories)
    }
    
    // MARK: - Get
    func getRepositories() -> [CustomRepositoryModel] {
        return self.repositories
    }
}
