//
//  ListTableViewCell.swift
//  GitHubApp
//
//  Created by Oguzhan Yalcin on 22.01.2023.
//

import UIKit

final class ListTableViewCell: UITableViewCell {

    // MARK: - Outlets
    @IBOutlet private weak var containerView: UIView!
    @IBOutlet private weak var avatarImageView: UIImageView!
    @IBOutlet private weak var fullNameLabel: UILabel!
    @IBOutlet private weak var languageLabel: UILabel!
    @IBOutlet private weak var watchersLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    public func configureCell(with repository: CustomRepositoryModel) {
        self.setupViews()
        containerView.backgroundColor = repository.visibilityStatus.stateColour
        avatarImageView.downloadImage(imageKey: repository.avatarUrl, defaultImage: "DefaultListImage")
        fullNameLabel.text = repository.fullName
        languageLabel.text = repository.language
        watchersLabel.text = "Watchers: \(repository.watchersCount)"
    }
    
    fileprivate func setupViews() {
        containerView.roundCorners(size: CGFloat(10).ws)
        fullNameLabel.font = UIFont.titleFont
        fullNameLabel.textColor = UIColor.titleColour
        languageLabel.font = UIFont.textFont
        languageLabel.textColor = UIColor.textColour
        watchersLabel.font = UIFont.textFont
        watchersLabel.textColor = UIColor.textColour
    }
}
