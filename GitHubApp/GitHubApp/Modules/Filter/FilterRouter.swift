//
//  FilterRouter.swift
//  GitHubApp
//
//  Created by Oguzhan Yalcin on 22.01.2023.
//

import UIKit

final class FilterRouter {
    
    weak var view: UIViewController?
    
    public func returnVC(with filtersStatus: [VisibilityStatus: Bool],
                         sortStatus: SortStatus,
                         delegate: FilterDelegate?) -> UIViewController {
        return FilterBuilder.buildModule(with: filtersStatus,
                                         sortStatus: sortStatus,
                                         delegate: delegate)
    }
}

extension FilterRouter: PFilterPresenterToRouter { }

// MARK: - Builder
enum FilterBuilder {

    static func buildModule(with filtersStatus: [VisibilityStatus: Bool],
                            sortStatus: SortStatus,
                            delegate: FilterDelegate?) -> UIViewController {
        let viewController = FilterViewController()
        let interactor = FilterInteractor()
        let router = FilterRouter()
        let presenter = FilterPresenter(view: viewController,
                                        interactor: interactor,
                                        router: router,
                                        delegate: delegate)
        let connectorCollectionView = FilterCollectionViewConnector(presenter: presenter)
        
        viewController.presenter = presenter
        viewController.connectorCollectionView = connectorCollectionView
        
        router.view = viewController
        
        interactor.presenter = presenter
        interactor.filterStatus = filtersStatus
        interactor.sortStatus = sortStatus
        
        return viewController
    }
}
