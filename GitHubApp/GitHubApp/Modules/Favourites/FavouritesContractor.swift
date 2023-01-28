//
//  FavouritesContractor.swift
//  GitHubApp
//
//  Created by Oguzhan Yalcin on 28.01.2023.
//

import Foundation

protocol PFavouritesPresenterToView: PresenterToView {
    func reloadTableView()
}

protocol PFavouritesViewToPresenter: ViewToPresenter { }

protocol PFavouritesPresenterToInteractor: PresenterToInteractor {
    func getRepositories() -> [CustomRepositoryModel]
}

protocol PFavouritesInteractorToPresenter: InteractorToPresenter { }

protocol PFavouritesPresenterToRouter: PresenterToRouter {
    func navigateToDetail(with repository: CustomRepositoryModel)
}

protocol PFavouritesConnectorToPresenter: ConnectorToPresenter {
    func getRepositories() -> [CustomRepositoryModel]
    func handleSelectedRepository(index: Int)
}
