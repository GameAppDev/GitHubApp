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
    
    public func configureCell(name: String,
                              isSelected: Bool) {
        self.setupViews()
        containerView.setBorder(width: CGFloat(1).ws, color: (isSelected ? UIColor.selectedColour : UIColor.notSelectedColour))
        nameLabel.text = name
        nameLabel.textColor = (isSelected ? UIColor.selectedColour : UIColor.notSelectedColour)
    }
    
    fileprivate func setupViews() {
        containerView.roundCorners(size: CGFloat(6).ws)
        containerView.setBorder(width: CGFloat(1).ws, color: UIColor.notSelectedColour)
        nameLabel.font = UIFont.textFont
        nameLabel.textColor = UIColor.notSelectedColour
    }
}
