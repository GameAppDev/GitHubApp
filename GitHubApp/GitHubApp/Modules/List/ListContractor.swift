//
//  ListContractor.swift
//  GitHubApp
//
//  Created by Oguzhan Yalcin on 21.01.2023.
//

import Foundation

protocol PListPresenterToView: PresenterToView {
    func reloadTableView()
}

protocol PListViewToPresenter: ViewToPresenter { }

protocol PListPresenterToInteractor: PresenterToInteractor {
    func getRepositories() -> [CustomRepositoryModel]
}

protocol PListInteractorToPresenter: InteractorToPresenter { }

protocol PListPresenterToRouter: PresenterToRouter {
    func navigateToDetail(with repository: CustomRepositoryModel)
}

protocol PListConnectorToPresenter: ConnectorToPresenter {
    func getRepositories() -> [CustomRepositoryModel]
    func handleSelectedRepository(index: Int)
}
