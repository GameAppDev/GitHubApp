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

protocol PListPresenterToInteractor: PresenterToInteractor { }

protocol PListInteractorToPresenter: InteractorToPresenter { }

protocol PListPresenterToRouter: PresenterToRouter {
    func navigateToDetail()
}

protocol PListConnectorToPresenter: ConnectorToPresenter { }
