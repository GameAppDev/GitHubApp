//
//  ListTableViewConnector.swift
//  GitHubApp
//
//  Created by Oguzhan Yalcin on 22.01.2023.
//

import UIKit

final class ListTableViewConnector: NSObject {
    
    private let presenter: PListConnectorToPresenter?
    
    init(presenter: PListConnectorToPresenter) {
        self.presenter = presenter
    }
}

extension ListTableViewConnector: UITableViewDataSource, UITableViewDelegate {
    
    // MARK: - Count
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (presenter?.getRepositories().count ?? 0)
    }
    
    // MARK: - Header
    
    // MARK: - Cells
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: ListTableViewHeaderView.className) as? ListTableViewHeaderView
        else { return UIView() }
        
        headerView.configureView(delegate: self, buttonTitle: "  Filter & Sort  ")
        
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let listCell = tableView.dequeueReusableCell(withIdentifier: ListTableViewCell.className,
                                                           for: indexPath) as? ListTableViewCell
        else { return UITableViewCell() }

        guard let repoList = presenter?.getRepositories(),
              let repo = repoList[safe: indexPath.row]
        else { return UITableViewCell() }

        listCell.configureCell(with: repo)
        
        return listCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.handleSelectedRepository(index: indexPath.row)
    }
}

extension ListTableViewConnector: ListTableViewHeaderViewProtocol {
    
    func filterClicked() {
        presenter?.handleFilterClicked()
    }
}
