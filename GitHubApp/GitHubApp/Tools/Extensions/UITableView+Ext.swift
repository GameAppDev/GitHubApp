//
//  UITableView+Ext.swift
//  GitHubApp
//
//  Created by Oguzhan Yalcin on 21.01.2023.
//

import UIKit

extension UITableView {
    
    func registerCell<T: UITableViewCell>(_ cell: T.Type) {
        register(nibFromClass(cell), forCellReuseIdentifier: cell.className)
    }

    func registerHeaderFooterView<T: UITableViewHeaderFooterView>(_ cell: T.Type) {
        register(nibFromClass(cell), forHeaderFooterViewReuseIdentifier: cell.className)
    }
    
    fileprivate func nibFromClass(_ type: UIView.Type) -> UINib {
        return UINib(nibName: type.className, bundle: nil)
    }
}
