//
//  ListViewController.swift
//  GitHubApp
//
//  Created by Oguzhan Yalcin on 21.01.2023.
//

import UIKit

final class ListViewController: BaseViewController {

    // MARK: - Outlet
    @IBOutlet private weak var listTableView: UITableView!
    
    var presenter: PListViewToPresenter?
    var connectorTableView: ListTableViewConnector?
    
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
        listTableView.backgroundColor = UIColor.clear
        listTableView.contentInset = UIEdgeInsets(top: CGFloat(10).ws,
                                                  left: CGFloat(0),
                                                  bottom: CGFloat(10).ws,
                                                  right: CGFloat(0))
        listTableView.dataSource = connectorTableView
        listTableView.delegate = connectorTableView
        listTableView.separatorStyle = .none
        listTableView.registerHeaderFooterView(ListTableViewHeaderFooterView.self)
        listTableView.registerCell(CustomCardTableViewCell.self)
    }
}

extension ListViewController: PListPresenterToView {
    
    func reloadTableView() {
        listTableView.reloadData()
    }
    
    // MARK: - PresenterToView
    func setNavBar(title: String) {
        setNavigationBarItems(title: title)
    }
}
