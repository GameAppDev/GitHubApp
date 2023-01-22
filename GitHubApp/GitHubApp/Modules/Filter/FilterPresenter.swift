//
//  FilterPresenter.swift
//  GitHubApp
//
//  Created by Oguzhan Yalcin on 22.01.2023.
//

import Foundation

final class FilterPresenter {
    
    private weak var view: PFilterPresenterToView?
    private var interactor: PFilterPresenterToInteractor?
    private var router: PFilterPresenterToRouter?
    
    init(view: PFilterPresenterToView,
         interactor: PFilterPresenterToInteractor,
         router: PFilterPresenterToRouter) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
}

extension FilterPresenter: PFilterViewToPresenter {
    
    // MARK: - ViewToPresenter
    func viewDidLoad() { }
    
    func viewWillAppear() {
        view?.setNavBar?(title: "Filter & Sort")
    }
}

extension FilterPresenter: PFilterInteractorToPresenter {
    
    // MARK: - InteractorToPresenter
    func setData<T>(data: T) { }
    
    func setError(errorMessage: String) {
        view?.hideIndicatorView()
        view?.showAlert(message: errorMessage)
    }
}

extension FilterPresenter: PFilterConnectorToPresenter { }
