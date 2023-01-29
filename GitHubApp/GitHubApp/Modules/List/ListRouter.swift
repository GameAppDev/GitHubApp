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
    
    func navigateToDetail(with repository: CustomRepositoryModel) {
        let viewController = DetailRouter().returnVC(repository: repository)
        view?.navigationController?.push(viewController)
    }
    
    func navigateToFilter(with filtersStatus: [VisibilityStatus: Bool],
                          sortStatus: SortStatus,
                          delegate: FilterDelegate?) {
        let viewController = FilterRouter().returnVC(with: filtersStatus,
                                                     sortStatus: sortStatus,
                                                     delegate: delegate)
        view?.navigationController?.push(viewController)
    }
    
    func navigateToFavourites() {
        let viewController = FavouritesRouter().returnVC()
        view?.navigationController?.push(viewController)
    }
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
        let connectorTableView = ListTableViewConnector(presenter: presenter)
        
        viewController.presenter = presenter
        viewController.connectorTableView = connectorTableView
        
        router.view = viewController
        
        interactor.presenter = presenter
        
        return viewController
    }
}
