//
//  DetailRouter.swift
//  GitHubApp
//
//  Created by Oguzhan Yalcin on 22.01.2023.
//

import UIKit

final class DetailRouter {
    
    weak var view: UIViewController?
    
    public func returnVC(repository: CustomRepositoryModel) -> UIViewController {
        return DetailBuilder.buildModule(repository: repository)
    }
}

extension DetailRouter: PDetailPresenterToRouter { }

// MARK: - Builder
enum DetailBuilder {

    static func buildModule(repository: CustomRepositoryModel) -> UIViewController {
        let viewController = DetailViewController()
        let interactor = DetailInteractor()
        let router = DetailRouter()
        let presenter = DetailPresenter(view: viewController,
                                        interactor: interactor,
                                        router: router)
        
        viewController.presenter = presenter
        
        router.view = viewController
        
        interactor.presenter = presenter
        interactor.repository = repository
        
        return viewController
    }
}
