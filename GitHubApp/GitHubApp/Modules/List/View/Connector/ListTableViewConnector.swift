//
//  ListTableViewConnector.swift
//  GitHubApp
//
//  Created by Oguzhan Yalcin on 22.01.2023.
//

import UIKit

final class ListTableViewConnector: NSObject {
    
    private let presenter: PListConnectorToPresenter?
    
    private var headerViewButtonTag: Int { get { return 0 } }
    private var footerViewButtonTag: Int { get { return 1 } }
    
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
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: ListTableViewHeaderFooterView.className) as? ListTableViewHeaderFooterView
        else { return UIView() }
        
        headerView.configureView(delegate: self,
                                 buttonTitle: "Filter & Sort".marginForButtonTitle)
        headerView.setButtonTag(headerViewButtonTag)
        
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    // MARK: - Cells
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let listCell = tableView.dequeueReusableCell(withIdentifier: CustomCardTableViewCell.className,
                                                           for: indexPath) as? CustomCardTableViewCell
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
    
    // MARK: - Footer
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        guard let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: ListTableViewHeaderFooterView.className) as? ListTableViewHeaderFooterView
        else { return UIView() }
        
        headerView.configureView(delegate: self,
                                 buttonTitle: "Favourites".marginForButtonTitle)
        headerView.setButtonTag(footerViewButtonTag)
        
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return UITableView.automaticDimension
    }
}

extension ListTableViewConnector: ListTableViewHeaderFooterViewProtocol {
    
    func buttonClicked(tag: Int) {
        switch tag {
        case headerViewButtonTag:
            presenter?.handleFilterClicked()
        case footerViewButtonTag:
            presenter?.handleFavouritesClicked()
        default: break
        }
    }
}
