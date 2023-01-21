//
//  ListRouter.swift
//  GitHubApp
//
//  Created by Oguzhan Yalcin on 21.01.2023.
//

import UIKit

final class ListRouter {
    
    weak var view: UIViewController?
    
    public func returnVC() -> UIViewController {
        return ListBuilder.buildModule()
    }
}

extension ListRouter: PListPresenterToRouter {
    
    func navigateToDetail() { }
}

// MARK: - Builder
enum ListBuilder {

    static func buildModule() -> UIViewController {
        let viewController = ListViewController()
        let interactor = ListInteractor()
        let router = ListRouter()
        let presenter = ListPresenter(view: viewController,
                                      interactor: interactor,
                                      router: router)
        let connectorTableView = ListTableView(presenter: presenter)
        
        viewController.presenter = presenter
        viewController.connectorTableView = connectorTableView
        
        router.view = viewController
        
        interactor.presenter = presenter
        
        return viewController
    }
}
