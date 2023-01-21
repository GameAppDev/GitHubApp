//
//  DetailPresenter.swift
//  GitHubApp
//
//  Created by Oguzhan Yalcin on 22.01.2023.
//

import Foundation

final class DetailPresenter {
    
    private weak var view: PDetailPresenterToView?
    private var interactor: PDetailPresenterToInteractor?
    private var router: PDetailPresenterToRouter?
    
    init(view: PDetailPresenterToView,
         interactor: PDetailPresenterToInteractor,
         router: PDetailPresenterToRouter) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
}

extension DetailPresenter: PDetailViewToPresenter {
    
    // MARK: - ViewToPresenter
    func viewDidLoad() { }
    
    func viewWillAppear() {
        view?.setNavBar?(title: "Detail")
    }
}

extension DetailPresenter: PDetailInteractorToPresenter {
    
    // MARK: - InteractorToPresenter
    func setData<T>(data: T) { }
    
    func setError(error: BaseError) {
        view?.hideIndicatorView()
        view?.showAlert(message: error.errorMessage ?? "Try again")
    }
}
