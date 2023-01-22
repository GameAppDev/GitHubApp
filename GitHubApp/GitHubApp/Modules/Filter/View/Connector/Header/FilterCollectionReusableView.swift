//
//  FilterCollectionReusableView.swift
//  GitHubApp
//
//  Created by Oguzhan Yalcin on 22.01.2023.
//

import UIKit

final class FilterCollectionReusableView: UICollectionReusableView {

    @IBOutlet private weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    public func configureView(name: String) {
        self.setupViews()
        nameLabel.text = name
    }
    
    fileprivate func setupViews() {
        nameLabel.font = UIFont.titleFont
        nameLabel.textColor = UIColor.titleColour
    }
}
