//
//  FilterInteractor.swift
//  GitHubApp
//
//  Created by Oguzhan Yalcin on 22.01.2023.
//

import Foundation

final class FilterInteractor {
    
    weak var presenter: PFilterInteractorToPresenter?
}

extension FilterInteractor: PFilterPresenterToInteractor {
    
    // MARK: - Fetch
    func fetchData<T>(request: T) { }
}
