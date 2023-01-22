//
//  ListInteractor.swift
//  GitHubApp
//
//  Created by Oguzhan Yalcin on 21.01.2023.
//

import Foundation

final class ListInteractor {
    
    weak var presenter: PListInteractorToPresenter?
    
    private var repositories = [CustomRepositoryModel]()
}

extension ListInteractor: PListPresenterToInteractor {
    
    // MARK: - Fetch
    func fetchData<T>(request: T) {
        let endPoint: String = "orgs/google/repos"
        NetworkManager().get(path: endPoint, paramaters: nil, onSuccess: { [weak self] (response: BaseResponse<[RepoResponse]>) in
            guard let self = self else { return }
            
            debugPrint("<--- Service gets response: \(response.model ?? []) - count: \(response.model?.count ?? 0) - path: \(endPoint) --->")
            if let data = response.model {
                self.repositories = data.map({ repo in
                    CustomRepositoryModel(repoResponse: repo)
                })
                self.presenter?.setData(data: self.repositories)
            } else {
                self.presenter?.setError(errorMessage: "Try again")
            }
        }) { [weak self] (error) in
            guard let self = self else { return }

            debugPrint("<---! Service gets error: \(error) - path: \(endPoint) !--->")
            self.presenter?.setError(errorMessage: error.errorMessage ?? "Try again")
        }
    }
    
    func getRepositories() -> [CustomRepositoryModel] {
        return self.repositories
    }
}
