//
//  ListContractor.swift
//  GitHubApp
//
//  Created by Oguzhan Yalcin on 21.01.2023.
//

import Foundation

protocol PListPresenterToView: PresenterToView {
    func reloadTableView()
}

protocol PListViewToPresenter: ViewToPresenter { }

protocol PListPresenterToInteractor: PresenterToInteractor {
    func getRepositories() -> [CustomRepositoryModel]
    func sortRepositoriesWithFilter()
    func setFiltersToDefault()
    func getFilterStatus() -> [VisibilityStatus: Bool]
    func getSortStatus() -> SortStatus
    func setFilterStatus(to status: [VisibilityStatus: Bool])
    func setSortStatus(to status: SortStatus)
}

protocol PListInteractorToPresenter: InteractorToPresenter { }

protocol PListPresenterToRouter: PresenterToRouter {
    func navigateToDetail(with repository: CustomRepositoryModel)
    func navigateToFilter(with filtersStatus: [VisibilityStatus: Bool],
                          sortStatus: SortStatus,
                          delegate: FilterDelegate?)
    func navigateToFavourites()
}

protocol PListConnectorToPresenter: ConnectorToPresenter {
    func getRepositories() -> [CustomRepositoryModel]
    func handleSelectedRepository(index: Int)
    func handleFilterClicked()
    func handleFavouritesClicked()
}
