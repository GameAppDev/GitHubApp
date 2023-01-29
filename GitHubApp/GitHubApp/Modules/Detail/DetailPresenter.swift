//
//  DetailPresenter.swift
//  GitHubApp
//
//  Created by Oguzhan Yalcin on 22.01.2023.
//

import Foundation

final class DetailPresenter {
    
    private weak var view: PDetailPresenterToView?
    private var interactor: PDetailPresenterToInteractor?
    private var router: PDetailPresenterToRouter?
    
    init(view: PDetailPresenterToView,
         interactor: PDetailPresenterToInteractor,
         router: PDetailPresenterToRouter) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
}

extension DetailPresenter {
    
    private func isFavRepository() -> Bool {
        let favRepos = CoreDataManager.shared.getFavouriteRepos()
        let selectedRepo = interactor?.getRepository()
        
        guard (favRepos.first(where: { $0.id == selectedRepo?.id }) != nil) else {
            return false
        }
        return true
    }
}

extension DetailPresenter: PDetailViewToPresenter {
    
    // MARK: - ViewToPresenter
    func viewDidLoad() {
        guard let repository = interactor?.getRepository() else { return }
        
        view?.setAvatarImageView(imageUrl: repository.avatarUrl)
        view?.setNameLabel(text: repository.fullName)
        view?.setDescriptionLabel(text: repository.description)
        view?.setLanguageLabel(text: repository.language)
        view?.setWatchersLabel(text: "\(repository.watchersCount) Watchers")
        view?.setStatusLabel(text: repository.visibilityStatus.rawValue.uppercased())
        view?.setCreatedDateLabel(text: repository.createdAt.toFormattedDate(dateFormat: "yyyy-MM-dd'T'HH:mm:ssZ",
                                                                             stringFormat: "MM-dd-yyyy"))
        view?.setUpdatedDateLabel(text: repository.updatedAt.toFormattedDate(dateFormat: "yyyy-MM-dd'T'HH:mm:ssZ",
                                                                             stringFormat: "MM-dd-yyyy"))
        view?.setPushedDateLabel(text: repository.pushedAt.toFormattedDate(dateFormat: "yyyy-MM-dd'T'HH:mm:ssZ",
                                                                           stringFormat: "MM-dd-yyyy"))
        view?.setRepoUrlLabel(text: repository.reposUrl)
        view?.setLicenseUrlLabel(text: repository.licenseUrl)
        view?.setFavButton(title: "Favourite")
        view?.setFavButton(isEnabled: !isFavRepository())
    }
    
    func viewWillAppear() {
        view?.setNavBar?(title: "Detail")
    }
    
    func handleFavClicked() {
        view?.setFavButton(isEnabled: false)
        view?.showIndicatorView()
        interactor?.setRepositoryAsFavourite()
    }
}

extension DetailPresenter: PDetailInteractorToPresenter {
    
    // MARK: - InteractorToPresenter
    func setData<T>(data: T) {
        view?.hideIndicatorView()
    }
    
    func setError(errorMessage: String) {
        view?.hideIndicatorView()
        view?.showAlert(message: errorMessage)
    }
}
