//
//  FilterCollectionViewConnector.swift
//  GitHubApp
//
//  Created by Oguzhan Yalcin on 22.01.2023.
//

import UIKit

enum SectionStatus: String {
    case sortCase = "Sort Items"
    case filterCase = "Filter Items"
}

final class FilterCollectionViewConnector: NSObject {
    
    private let presenter: PFilterConnectorToPresenter?

    private let sectionItems: [SectionStatus] = [.sortCase, .filterCase]
    
    init(presenter: PFilterConnectorToPresenter) {
        self.presenter = presenter
    }
}

extension FilterCollectionViewConnector: UICollectionViewDelegate, UICollectionViewDataSource {

    // MARK: - Count
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return sectionItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let sectionItem = sectionItems[safe: section] else { return 0 }
        
        switch sectionItem {
        case .sortCase:
            return SortStatus.allCases.count
        case .filterCase:
            return VisibilityStatus.allCases.count
        }
    }

    // MARK: - Header
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard kind == UICollectionView.elementKindSectionHeader
        else { return UICollectionReusableView() }
        
        guard let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind,
                                                                               withReuseIdentifier: FilterCollectionReusableView.className,
                                                                               for: indexPath) as? FilterCollectionReusableView
        else { return UICollectionReusableView() }
        
        guard let sectionName = sectionItems[safe: indexPath.section]?.rawValue
        else { return UICollectionReusableView() }
        
        headerView.configureView(name: sectionName)
        
        return headerView
    }
    
    // MARK: - Cells
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FilterCollectionViewCell.className,
                                                            for: indexPath) as? FilterCollectionViewCell
        else { return UICollectionViewCell() }

        guard let sectionItem = sectionItems[safe: indexPath.section] else { return UICollectionViewCell() }
        switch sectionItem {
        case .sortCase:
            guard let sortStatus: SortStatus = SortStatus.allCases[safe: indexPath.row]
            else { return UICollectionViewCell() }
            
            let sortName: String = sortStatus.rawValue
            let isSelected: Bool = presenter?.getSortStatus() == sortStatus
            cell.configureCell(name: sortName, isSelected: isSelected)
        case .filterCase:
            guard let filterStatus: VisibilityStatus = VisibilityStatus.allCases[safe: indexPath.row]
            else { return UICollectionViewCell() }
            
            let filterName: String = filterStatus.rawValue
            let isSelected: Bool = presenter?.getSelectedFilterStatus() == filterStatus
            cell.configureCell(name: filterName, isSelected: isSelected)
        }
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let sectionItem = sectionItems[safe: indexPath.section] else { return }
        
        switch sectionItem {
        case .sortCase:
            presenter?.handleSortClicked(index: indexPath.row)
        case .filterCase:
            presenter?.handleFilterClicked(index: indexPath.row)
        }
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.init(top: CGFloat(10).ws,
                                 left: CGFloat(10).ws,
                                 bottom: CGFloat(10).ws,
                                 right: CGFloat(10).ws)
    }
}

extension FilterCollectionViewConnector: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: CGFloat(110), height: CGFloat(75))
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        let indexPath = IndexPath(row: 0, section: section)
        let headerView = self.collectionView(collectionView,
                                             viewForSupplementaryElementOfKind: UICollectionView.elementKindSectionHeader,
                                             at: indexPath)

        return headerView.systemLayoutSizeFitting(CGSize(width: collectionView.frame.width,
                                                         height: UIView.layoutFittingExpandedSize.height),
                                                  withHorizontalFittingPriority: .required,
                                                  verticalFittingPriority: .fittingSizeLevel)
    }
}
