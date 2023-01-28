//
//  ListTableViewHeaderFooterView.swift
//  GitHubApp
//
//  Created by Oguzhan Yalcin on 28.01.2023.
//

import UIKit

protocol ListTableViewHeaderFooterViewProtocol: AnyObject {
    func buttonClicked(tag: Int)
}

final class ListTableViewHeaderFooterView: UITableViewHeaderFooterView {

    @IBOutlet private weak var customButton: UIButton!
    
    weak var delegate: ListTableViewHeaderFooterViewProtocol?
    
    public func configureView(delegate: ListTableViewHeaderFooterViewProtocol?,
                              buttonTitle: String) {
        self.setupViews()
        self.delegate = delegate
        customButton.setTitle(buttonTitle, for: .normal)
    }
    
    public func setButtonTag(_ tag: Int) {
        self.customButton.tag = tag
    }
    
    fileprivate func setupViews() {
        customButton.roundCorners(size: CGFloat(10).ws)
        customButton.backgroundColor = UIColor.navBarBGColour
        customButton.titleLabel?.font = UIFont.navBarTextFont
        customButton.setTitleColor(UIColor.navBarTextColour, for: .normal)
    }
    
    @IBAction private func customButtonClicked(_ sender: UIButton) {
        delegate?.buttonClicked(tag: sender.tag)
    }
}
