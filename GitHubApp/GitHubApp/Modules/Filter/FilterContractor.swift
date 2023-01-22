//
//  FilterContractor.swift
//  GitHubApp
//
//  Created by Oguzhan Yalcin on 22.01.2023.
//

import Foundation

protocol PFilterPresenterToView: PresenterToView {
    func reloadCollectionView()
}

protocol PFilterViewToPresenter: ViewToPresenter { }

protocol PFilterPresenterToInteractor: PresenterToInteractor { }

protocol PFilterInteractorToPresenter: InteractorToPresenter { }

protocol PFilterPresenterToRouter: PresenterToRouter { }

protocol PFilterConnectorToPresenter: ConnectorToPresenter { }
