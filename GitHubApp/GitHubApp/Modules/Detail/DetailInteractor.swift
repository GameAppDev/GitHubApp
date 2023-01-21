//
//  DetailInteractor.swift
//  GitHubApp
//
//  Created by Oguzhan Yalcin on 22.01.2023.
//

import Foundation

final class DetailInteractor {
    
    weak var presenter: PDetailInteractorToPresenter?
}

extension DetailInteractor: PDetailPresenterToInteractor {
    
    // MARK: - Fetch
    func fetchData<T>(request: T) { }
}
