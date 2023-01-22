//
//  ListTableViewHeaderView.swift
//  GitHubApp
//
//  Created by Oguzhan Yalcin on 22.01.2023.
//

import UIKit

protocol ListTableViewHeaderViewProtocol: AnyObject {
    func filterClicked()
}

final class ListTableViewHeaderView: UITableViewHeaderFooterView {

    @IBOutlet private weak var filterAndSortButton: UIButton!
    
    weak var delegate: ListTableViewHeaderViewProtocol?
    
    public func configureView(delegate: ListTableViewHeaderViewProtocol?, buttonTitle: String) {
        self.setupViews()
        self.delegate = delegate
        filterAndSortButton.setTitle(buttonTitle, for: .normal)
    }
    
    fileprivate func setupViews() {
        filterAndSortButton.roundCorners(size: CGFloat(4).ws)
        filterAndSortButton.backgroundColor = UIColor.navBarBGColour
        filterAndSortButton.titleLabel?.font = UIFont.navBarTextFont
        filterAndSortButton.setTitleColor(UIColor.navBarTextColour, for: .normal)
    }
    
    @IBAction private func filterAndSortButtonClicked(_ sender: UIButton) {
        delegate?.filterClicked()
    }
}
