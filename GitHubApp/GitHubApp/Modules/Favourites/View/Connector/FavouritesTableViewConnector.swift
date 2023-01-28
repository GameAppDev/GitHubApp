//
//  FavouritesTableViewConnector.swift
//  GitHubApp
//
//  Created by Oguzhan Yalcin on 28.01.2023.
//

import UIKit

final class FavouritesTableViewConnector: NSObject {
    
    private let presenter: PFavouritesConnectorToPresenter?
    
    init(presenter: PFavouritesConnectorToPresenter) {
        self.presenter = presenter
    }
}

extension FavouritesTableViewConnector: UITableViewDataSource, UITableViewDelegate {
    
    // MARK: - Count
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (presenter?.getRepositories().count ?? 0)
    }
    
    // MARK: - Cells
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
