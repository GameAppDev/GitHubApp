//
//  ListInteractor.swift
//  GitHubApp
//
//  Created by Oguzhan Yalcin on 21.01.2023.
//

import Foundation

final class ListInteractor {
    
    weak var presenter: PListInteractorToPresenter?
}

extension ListInteractor: PListPresenterToInteractor {
    
    // MARK: - Fetch
    func fetchData<T>(request: T) { }
}
