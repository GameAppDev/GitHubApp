//
//  DetailRouter.swift
//  GitHubApp
//
//  Created by Oguzhan Yalcin on 22.01.2023.
//

import UIKit

final class DetailRouter {
    
    weak var view: UIViewController?
    
    public func returnVC() -> UIViewController {
        return DetailBuilder.buildModule()
    }
}

extension DetailRouter: PDetailPresenterToRouter { }

// MARK: - Builder
enum DetailBuilder {

    static func buildModule() -> UIViewController {
        let viewController = DetailViewController()
        let interactor = DetailInteractor()
        let router = DetailRouter()
        let presenter = DetailPresenter(view: viewController,
                                        interactor: interactor,
                                        router: router)
        
        viewController.presenter = presenter
        
        router.view = viewController
        
        interactor.presenter = presenter
        
        return viewController
    }
}
