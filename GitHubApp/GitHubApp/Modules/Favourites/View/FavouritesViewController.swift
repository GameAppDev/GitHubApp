//
//  FavouritesViewController.swift
//  GitHubApp
//
//  Created by Oguzhan Yalcin on 28.01.2023.
//

import UIKit

final class FavouritesViewController: BaseViewController {

    // MARK: - Outlet
    @IBOutlet private weak var favouriteListTableView: UITableView!
    
    var presenter: PFavouritesViewToPresenter?
    var connectorTableView: FavouritesTableViewConnector?
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupTableView()
        presenter?.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        presenter?.viewWillAppear()
    }
    
    fileprivate func setupTableView() {
        favouriteListTableView.backgroundColor = UIColor.clear
        favouriteListTableView.contentInset = UIEdgeInsets(top: CGFloat(10).ws,
                                                           left: CGFloat(0),
                                                           bottom: CGFloat(10).ws,
                                                           right: CGFloat(0))
        favouriteListTableView.dataSource = connectorTableView
        favouriteListTableView.delegate = connectorTableView
        favouriteListTableView.separatorStyle = .none
        favouriteListTableView.registerCell(CustomCardTableViewCell.self)
    }
}

extension FavouritesViewController: PFavouritesPresenterToView {
    
    func reloadTableView() {
        favouriteListTableView.reloadData()
    }
    
    // MARK: - PresenterToView
    func setNavBar(title: String) {
        setNavigationBarItems(title: title)
    }
}
