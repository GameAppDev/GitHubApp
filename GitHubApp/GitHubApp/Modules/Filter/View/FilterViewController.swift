//
//  FilterViewController.swift
//  GitHubApp
//
//  Created by Oguzhan Yalcin on 22.01.2023.
//

import UIKit

final class FilterViewController: BaseViewController {

    // MARK: - Outlet
    @IBOutlet private weak var filterSortCollectionView: UICollectionView!
    
    var presenter: PFilterViewToPresenter?
    var connectorCollectionView: FilterCollectionViewConnector?
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupCollectionView()
        presenter?.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        presenter?.viewWillAppear()
    }

    fileprivate func setupCollectionView() {
        filterSortCollectionView.dataSource = connectorCollectionView
        filterSortCollectionView.delegate = connectorCollectionView
        filterSortCollectionView.registerHeaderCell(FilterCollectionReusableView.self)
        filterSortCollectionView.registerCell(FilterCollectionViewCell.self)
    }
}

extension FilterViewController: PFilterPresenterToView {
    
    func reloadCollectionView() {
        filterSortCollectionView.reloadData()
    }
    
    // MARK: - PresenterToView
    func setNavBar(title: String) {
        setNavigationBarItems(title: title)
    }
}
