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
    weak var delegate: FilterDelegate?
    
    init(view: PFilterPresenterToView,
         interactor: PFilterPresenterToInteractor,
         router: PFilterPresenterToRouter,
         delegate: FilterDelegate?) {
        self.view = view
        self.interactor = interactor
        self.router = router
        self.delegate = delegate
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

extension FilterPresenter: PFilterConnectorToPresenter {
    
    func getSortStatus() -> SortStatus {
        return interactor?.getSortStatus() ?? .byCreatedAt
    }
    
    func getSelectedFilterStatus() -> VisibilityStatus {
        return interactor?.getSelectedFilterStatus() ?? .all
    }
    
    func handleFilterClicked(index: Int) {
        guard let filterStatus = VisibilityStatus.allCases[safe: index],
              let sortStatus = interactor?.getSortStatus(),
              let interactor = interactor
        else { return }
        
        interactor.setFilterStatus(with: filterStatus, isSelected: true)
        delegate?.applyFilterClicked(filtersStatus: interactor.getFilterStatus(), sortStatus: sortStatus)
        view?.reloadCollectionView()
    }
    
    func handleSortClicked(index: Int) {
        guard let sortStatus = SortStatus.allCases[safe: index],
              let filterStatus = interactor?.getFilterStatus()
        else { return }
        
        interactor?.setSortStatus(to: sortStatus)
        delegate?.applyFilterClicked(filtersStatus: filterStatus, sortStatus: sortStatus)
        view?.reloadCollectionView()
    }
}
