//
//  FilterRouter.swift
//  GitHubApp
//
//  Created by Oguzhan Yalcin on 22.01.2023.
//

import UIKit

final class FilterRouter {
    
    weak var view: UIViewController?
    
    public func returnVC() -> UIViewController {
        return ListBuilder.buildModule()
    }
}

extension FilterRouter: PFilterPresenterToRouter { }

// MARK: - Builder
enum FilterBuilder {

    static func buildModule() -> UIViewController {
        let viewController = FilterViewController()
        let interactor = FilterInteractor()
        let router = FilterRouter()
        let presenter = FilterPresenter(view: viewController,
                                        interactor: interactor,
                                        router: router)
        let connectorCollectionView = FilterCollectionViewConnector(presenter: presenter)
        
        viewController.presenter = presenter
        viewController.connectorCollectionView = connectorCollectionView
        
        router.view = viewController
        
        interactor.presenter = presenter
        
        return viewController
    }
}
