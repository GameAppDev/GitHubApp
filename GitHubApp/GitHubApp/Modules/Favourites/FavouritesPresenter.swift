//
//  FavouritesPresenter.swift
//  GitHubApp
//
//  Created by Oguzhan Yalcin on 28.01.2023.
//

import Foundation

final class FavouritesPresenter {
    
    private weak var view: PFavouritesPresenterToView?
    private var interactor: PFavouritesPresenterToInteractor?
    private var router: PFavouritesPresenterToRouter?
    
    init(view: PFavouritesPresenterToView,
         interactor: PFavouritesPresenterToInteractor,
         router: PFavouritesPresenterToRouter) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
}

extension FavouritesPresenter: PFavouritesViewToPresenter {
    
    // MARK: - ViewToPresenter
    func viewDidLoad() { }
    
    func viewWillAppear() {
        view?.setNavBar?(title: "Favourites")
    }
}

extension FavouritesPresenter: PFavouritesInteractorToPresenter {
    
    // MARK: - InteractorToPresenter
    func setData<T>(data: T) {
        view?.hideIndicatorView()
        view?.reloadTableView()
    }
    
    func setError(errorMessage: String) {
        view?.hideIndicatorView()
        view?.showAlert(message: errorMessage)
    }
}

extension FavouritesPresenter: PFavouritesConnectorToPresenter {
    
    func getRepositories() -> [CustomRepositoryModel] {
        return interactor?.getRepositories() ?? []
    }
    
    func handleSelectedRepository(index: Int) {
        guard let repositories = interactor?.getRepositories(),
              let repository = repositories[safe: index]
        else { return }
        
        router?.navigateToDetail(with: repository)
    }
}
