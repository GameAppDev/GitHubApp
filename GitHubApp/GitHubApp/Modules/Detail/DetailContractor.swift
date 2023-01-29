//
//  DetailContractor.swift
//  GitHubApp
//
//  Created by Oguzhan Yalcin on 22.01.2023.
//

import Foundation

protocol PDetailPresenterToView: PresenterToView {
    func setAvatarImageView(imageUrl: String)
    func setNameLabel(text: String)
    func setDescriptionLabel(text: String)
    func setLanguageLabel(text: String)
    func setWatchersLabel(text: String)
    func setStatusLabel(text: String)
    func setCreatedDateLabel(text: String)
    func setUpdatedDateLabel(text: String)
    func setPushedDateLabel(text: String)
    func setRepoUrlLabel(text: String)
    func setRepoUrlLabel(isHidden: Bool)
    func setLicenseUrlLabel(text: String)
    func setLicenseUrlLabel(isHidden: Bool)
    func setFavButton(title: String)
    func setFavButton(isEnabled: Bool)
}

protocol PDetailViewToPresenter: ViewToPresenter {
    func handleFavClicked()
}

protocol PDetailPresenterToInteractor: PresenterToInteractor {
    func getRepository() -> CustomRepositoryModel?
}

protocol PDetailInteractorToPresenter: InteractorToPresenter { }

protocol PDetailPresenterToRouter: PresenterToRouter { }
