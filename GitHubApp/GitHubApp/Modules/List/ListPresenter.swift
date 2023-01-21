//
//  ListPresenter.swift
//  GitHubApp
//
//  Created by Oguzhan Yalcin on 21.01.2023.
//

import Foundation

final class ListPresenter {
    
    private weak var view: PListPresenterToView?
    private var interactor: PListPresenterToInteractor?
    private var router: PListPresenterToRouter?
    
    init(view: PListPresenterToView,
         interactor: PListPresenterToInteractor,
         router: PListPresenterToRouter) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
}

extension ListPresenter: PListViewToPresenter {
    
    // MARK: - ViewToPresenter
    func viewDidLoad() {
        view?.showIndicatorView()
        interactor?.fetchData(request: "")
    }
    
    func viewWillAppear() {
        view?.setNavBar?(title: "List")
    }
}

extension ListPresenter: PListInteractorToPresenter {
    
    // MARK: - InteractorToPresenter
    func setData<T>(data: T) {
        view?.hideIndicatorView()
        view?.reloadTableView()
    }
    
    func setError(error: BaseError) {
        view?.hideIndicatorView()
        view?.showAlert(message: error.errorMessage ?? "Try again")
    }
}

extension ListPresenter: PListConnectorToPresenter { }
