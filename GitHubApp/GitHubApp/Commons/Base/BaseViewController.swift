//
//  BaseViewController.swift
//  GitHubApp
//
//  Created by Oguzhan Yalcin on 21.01.2023.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
    }
    
    private func setupViews() {
        self.view.backgroundColor = UIColor.viewBGColour
    }
    
    public func setNavigationBarItems(title: String) {
        self.navigationItem.title = title
        
        let textAttributes = [NSAttributedString.Key.foregroundColor: UIColor.navBarTextColour,
                              NSAttributedString.Key.font: UIFont.navBarTextFont]
        
        self.navigationController?.navigationBar.titleTextAttributes = textAttributes as [NSAttributedString.Key: Any]
    }
}
