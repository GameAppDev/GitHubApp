//
//  ListTableView.swift
//  GitHubApp
//
//  Created by Oguzhan Yalcin on 22.01.2023.
//

import UIKit

final class ListTableView: NSObject {
    
    private let presenter: PListConnectorToPresenter?
    
    init(presenter: PListConnectorToPresenter) {
        self.presenter = presenter
    }
}

extension ListTableView: UITableViewDataSource, UITableViewDelegate {
    
    // MARK: - Count
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (presenter?.getRepositories().count ?? 0)
    }
    
    // MARK: - Cells
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
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
