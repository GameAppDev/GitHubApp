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
        interactor?.setFiltersToDefault()
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
    
    func setError(errorMessage: String) {
        view?.hideIndicatorView()
        view?.showAlert(message: errorMessage)
    }
}

extension ListPresenter: PListConnectorToPresenter {
    
    func getRepositories() -> [CustomRepositoryModel] {
        return interactor?.getRepositories() ?? []
    }
    
    func handleSelectedRepository(index: Int) {
        guard let repositories = interactor?.getRepositories(),
              let repository = repositories[safe: index]
        else { return }
        
        router?.navigateToDetail(with: repository)
    }
    
    func handleFilterClicked() {
        if let filterStatus = interactor?.getFilterStatus(),
           let sortStatus = interactor?.getSortStatus() {
            router?.navigateToFilter(with: filterStatus,
                                     sortStatus: sortStatus,
                                     delegate: self)
        }
    }
    
    func handleFavouritesClicked() {
        router?.navigateToFavourites()
    }
}

extension ListPresenter: FilterDelegate {
    
    func applyFilterClicked(filtersStatus: [VisibilityStatus: Bool], sortStatus: SortStatus) {
        interactor?.setFilterStatus(to: filtersStatus)
        interactor?.setSortStatus(to: sortStatus)
        interactor?.sortRepositoriesWithFilter()
        
        view?.reloadTableView()
    }
}
