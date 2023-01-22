//
//  FilterInteractor.swift
//  GitHubApp
//
//  Created by Oguzhan Yalcin on 22.01.2023.
//

import Foundation

final class FilterInteractor {
    
    weak var presenter: PFilterInteractorToPresenter?
    var filterStatus = [VisibilityStatus: Bool]()
    var sortStatus: SortStatus?
}

extension FilterInteractor: PFilterPresenterToInteractor {
    
    // MARK: - Fetch
    func fetchData<T>(request: T) { }
    
    // MARK: - Get Filter-Sort Status
    func getFilterStatus() -> [VisibilityStatus: Bool] {
        return self.filterStatus
    }

    func getSortStatus() -> SortStatus {
        return self.sortStatus ?? .byCreatedAt
    }
    
    func getSelectedFilterStatus() -> VisibilityStatus {
        return filterStatus.first(where: { $0.value == true })?.key ?? .all
    }
    
    // MARK: - Set Filter-Sort Status
    func setFilterStatus(with status: VisibilityStatus, isSelected: Bool) {
        setFiltersToDefault()
        filterStatus[status] = isSelected
    }
    
    func setSortStatus(to status: SortStatus) {
        self.sortStatus = status
    }
}

extension FilterInteractor {
    
    func setFiltersToDefault() {
        VisibilityStatus.allCases.forEach { filterType in
            filterStatus[filterType] = false
        }
    }
}
