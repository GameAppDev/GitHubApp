//
//  UINavigationController+Ext.swift
//  GitHubApp
//
//  Created by Oguzhan Yalcin on 21.01.2023.
//

import UIKit

extension UINavigationController {
    
    var rootViewController: UIViewController {
        return self.viewControllers.first!
    }
    
    func push(_ vc: UIViewController) {
        self.pushViewController(vc, animated: true)
    }
}
