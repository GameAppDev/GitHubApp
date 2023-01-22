//
//  FilterCollectionViewCell.swift
//  GitHubApp
//
//  Created by Oguzhan Yalcin on 22.01.2023.
//

import UIKit

final class FilterCollectionViewCell: UICollectionViewCell {

    // MARK: - Outlets
    @IBOutlet private weak var containerView: UIView!
    @IBOutlet private weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    public func configureCell(name: String) {
        self.setupViews()
        nameLabel.text = name
    }
    
    fileprivate func setupViews() {
        containerView.roundCorners(size: CGFloat(6).ws)
        containerView.setBorder(width: CGFloat(1).ws, color: UIColor.navBarBGColour)
    }
}
