//
//  FavouritesRouter.swift
//  GitHubApp
//
//  Created by Oguzhan Yalcin on 28.01.2023.
//

import UIKit

final class FavouritesRouter {
    
    weak var view: UIViewController?
    
    public func returnVC() -> UIViewController {
        return FavouritesBuilder.buildModule()
    }
}

extension FavouritesRouter: PFavouritesPresenterToRouter {
    
    func navigateToDetail(with repository: CustomRepositoryModel) {
        let viewController = DetailRouter().returnVC(repository: repository)
        view?.navigationController?.push(viewController)
    }
}

// MARK: - Builder
enum FavouritesBuilder {

    static func buildModule() -> UIViewController {
        let viewController = FavouritesViewController()
        let interactor = FavouritesInteractor()
        let router = FavouritesRouter()
        let presenter = FavouritesPresenter(view: viewController,
                                            interactor: interactor,
                                            router: router)
        let connectorTableView = FavouritesTableViewConnector(presenter: presenter)
        
        viewController.presenter = presenter
        viewController.connectorTableView = connectorTableView
        
        router.view = viewController
        
        interactor.presenter = presenter
        
        return viewController
    }
}
