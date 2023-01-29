//
//  DetailViewController.swift
//  GitHubApp
//
//  Created by Oguzhan Yalcin on 22.01.2023.
//

import UIKit

final class DetailViewController: BaseViewController {

    // MARK: - Outlets
    @IBOutlet private weak var avatarImageView: UIImageView!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    @IBOutlet private weak var languageLabel: UILabel!
    @IBOutlet private weak var watchersLabel: UILabel!
    @IBOutlet private weak var statusLabel: UILabel!
    @IBOutlet private weak var createdDateLabel: UILabel!
    @IBOutlet private weak var updatedDateLabel: UILabel!
    @IBOutlet private weak var pushedDateLabel: UILabel!
    @IBOutlet private weak var repoUrlLabel: UILabel!
    @IBOutlet private weak var licenseUrlLabel: UILabel!
    @IBOutlet private weak var favButton: UIButton!
    
    var presenter: PDetailViewToPresenter?
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setupViews()
        presenter?.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        presenter?.viewWillAppear()
    }
    
    fileprivate func setupViews() {
        avatarImageView.roundCorners(size: CGFloat(10).ws)
        nameLabel.font = UIFont.titleFont
        nameLabel.textColor = UIColor.titleColour
        descriptionLabel.font = UIFont.textFont
        descriptionLabel.textColor = UIColor.textColour
        languageLabel.font = UIFont.textFont
        languageLabel.textColor = UIColor.textColour
        watchersLabel.font = UIFont.textFont
        watchersLabel.textColor = UIColor.textColour
        statusLabel.font = UIFont.textFont
        statusLabel.textColor = UIColor.textColour
        createdDateLabel.font = UIFont.textFont
        createdDateLabel.textColor = UIColor.textColour
        updatedDateLabel.font = UIFont.textFont
        updatedDateLabel.textColor = UIColor.textColour
        pushedDateLabel.font = UIFont.textFont
        pushedDateLabel.textColor = UIColor.textColour
        repoUrlLabel.font = UIFont.textFont
        repoUrlLabel.textColor = UIColor.textColour
        licenseUrlLabel.font = UIFont.textFont
        licenseUrlLabel.textColor = UIColor.textColour
        favButton.roundCorners(size: CGFloat(10).ws)
        favButton.titleLabel?.font = UIFont.navBarTextFont
    }
    
    @IBAction private func favButtonClicked(_ sender: UIButton) {
        presenter?.handleFavClicked()
    }
}

extension DetailViewController: PDetailPresenterToView {
    
    // MARK: - PresenterToView
    func setNavBar(title: String) {
        setNavigationBarItems(title: title)
    }
    
    func setAvatarImageView(imageUrl: String) {
        avatarImageView.downloadImage(imageKey: imageUrl, defaultImage: "DefaultCardImage")
    }
    
    func setNameLabel(text: String) {
        nameLabel.text = text
    }
    
    func setDescriptionLabel(text: String) {
        descriptionLabel.text = text
    }
    
    func setLanguageLabel(text: String) {
        languageLabel.text = text
    }
    
    func setWatchersLabel(text: String) {
        watchersLabel.text = text
    }
    
    func setStatusLabel(text: String) {
        statusLabel.text = text
    }
    
    func setCreatedDateLabel(text: String) {
        createdDateLabel.text = text
    }
    
    func setUpdatedDateLabel(text: String) {
        updatedDateLabel.text = text
    }
    
    func setPushedDateLabel(text: String) {
        pushedDateLabel.text = text
    }
    
    func setRepoUrlLabel(text: String) {
        repoUrlLabel.text = text
    }
    
    func setLicenseUrlLabel(text: String) {
        licenseUrlLabel.text = text
    }
    
    func setFavButton(title: String) {
        favButton.setTitle(title, for: .normal)
    }
    
    func setFavButton(isEnabled: Bool) {
        favButton.backgroundColor = isEnabled ? UIColor.navBarBGColour : UIColor.lightGray
        favButton.setTitleColor(isEnabled ? UIColor.navBarTextColour : UIColor.black, for: .normal)
        favButton.isEnabled = isEnabled
    }
}
