//
//  FilterContractor.swift
//  GitHubApp
//
//  Created by Oguzhan Yalcin on 22.01.2023.
//

import Foundation

protocol PFilterPresenterToView: PresenterToView {
    func reloadCollectionView()
}

protocol PFilterViewToPresenter: ViewToPresenter { }

protocol PFilterPresenterToInteractor: PresenterToInteractor {
    func getFilterStatus() -> [VisibilityStatus: Bool]
    func getSortStatus() -> SortStatus
    func getSelectedFilterStatus() -> VisibilityStatus
    func setFilterStatus(with status: VisibilityStatus, isSelected: Bool)
    func setSortStatus(to status: SortStatus)
}

protocol PFilterInteractorToPresenter: InteractorToPresenter { }

protocol PFilterPresenterToRouter: PresenterToRouter { }

protocol PFilterConnectorToPresenter: ConnectorToPresenter {
    func getSortStatus() -> SortStatus
    func getSelectedFilterStatus() -> VisibilityStatus
    func handleFilterClicked(index: Int)
    func handleSortClicked(index: Int)
}

// MARK: - Filter Button Delegate
protocol FilterDelegate: AnyObject {
    func applyFilterClicked(filtersStatus: [VisibilityStatus: Bool], sortStatus: SortStatus)
}
