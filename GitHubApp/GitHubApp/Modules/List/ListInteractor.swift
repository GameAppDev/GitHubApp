//
//  ListInteractor.swift
//  GitHubApp
//
//  Created by Oguzhan Yalcin on 21.01.2023.
//

import Foundation

final class ListInteractor {
    
    weak var presenter: PListInteractorToPresenter?
    
    private var repositoriesInitial = [CustomRepositoryModel]() // Initial Data, dont set
    private var repositories = [CustomRepositoryModel]() // Use it for set, changeable with sort and filter
    private var filterStatus = [VisibilityStatus: Bool]()
    private var sortStatus: SortStatus = .byCreatedAt
    // Set sortStatus .byCreatedAt as default
    // Comes from response as .byCreatedAt
}

extension ListInteractor: PListPresenterToInteractor {
    
    // MARK: - Fetch
    func fetchData<T>(request: T) {
        let endPoint: String = "orgs/google/repos"
        NetworkManager().get(path: endPoint, paramaters: nil, onSuccess: { [weak self] (response: BaseResponse<[RepoResponse]>) in
            guard let self = self else { return }
            
            debugPrint("<--- Service gets response: \(response.model ?? []) - count: \(response.model?.count ?? 0) - path: \(endPoint) --->")
            if let data = response.model {
                self.repositoriesInitial = data.map({ repo in
                    CustomRepositoryModel(repoResponse: repo)
                })
                self.repositories = self.repositoriesInitial
                self.presenter?.setData(data: self.repositoriesInitial)
            } else {
                self.presenter?.setError(errorMessage: "Try again")
            }
        }) { [weak self] (error) in
            guard let self = self else { return }

            debugPrint("<---! Service gets error: \(error) - path: \(endPoint) !--->")
            self.presenter?.setError(errorMessage: error.errorMessage ?? "Try again")
        }
    }
    
    // MARK: - Get
    func getRepositories() -> [CustomRepositoryModel] {
        return self.repositories
    }
    
    // MARK: - Set Model
    func sortRepositoriesWithFilter() {
        repositories = repositoriesInitial
        
        if getSelectedFilterStatus() != .all {
            repositories = repositories.compactMap { repo -> CustomRepositoryModel? in
                if getSelectedFilterStatus() == repo.visibilityStatus {
                    return repo
                } else {
                    return nil
                }
            }
        }
        
        sortRepositories()
    }
    
    // MARK: - Set Filter
    func setFiltersToDefault() {
        VisibilityStatus.allCases.forEach { filterType in
            filterStatus[filterType] = false
        }
        filterStatus[.all] = true
    }
    
    // MARK: - Get Filter-Sort Status
    func getFilterStatus() -> [VisibilityStatus: Bool] {
        return self.filterStatus
    }
    
    func getSortStatus() -> SortStatus {
        return self.sortStatus
    }
    
    // MARK: - Set Filter-Sort Status
    func setFilterStatus(to status: [VisibilityStatus: Bool]) {
        self.filterStatus = status
    }
    
    func setSortStatus(to status: SortStatus) {
        self.sortStatus = status
    }
}

extension ListInteractor {
    
    private func sortRepositories() {
        switch sortStatus {
        case .byFullName:
            repositories = repositories.sorted { $0.fullName.lowercased() < $1.fullName.lowercased() }
        case .byCreatedAt:
            repositories = repositories.sorted { $0.createdAtTimeInterval > $1.createdAtTimeInterval }
        case .byUpdatedAt:
            repositories = repositories.sorted { $0.updatedAtTimeInterval > $1.updatedAtTimeInterval }
        case .byPushedAt:
            repositories = repositories.sorted { $0.pushedAtTimeInterval > $1.pushedAtTimeInterval }
        }
    }
    
    private func getSelectedFilterStatus() -> VisibilityStatus {
        return filterStatus.first(where: { $0.value == true })?.key ?? .all
    }
}
