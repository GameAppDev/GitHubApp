//
//  FilterCollectionViewConnector.swift
//  GitHubApp
//
//  Created by Oguzhan Yalcin on 22.01.2023.
//

import UIKit

final class FilterCollectionViewConnector: NSObject {
    
    private let presenter: PFilterConnectorToPresenter?

    init(presenter: PFilterConnectorToPresenter) {
        self.presenter = presenter
    }
}

extension FilterCollectionViewConnector: UICollectionViewDelegate, UICollectionViewDataSource {
    // MARK: - Collection view data source

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let imageList = presenter.getImageList(), let pictureId = imageList[indexPath.item].imageid {
            presenter.pictureSelected(pictureId: pictureId)
        }
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.init(top: 12, left: 16, bottom: bottomInset, right: 16)
    }

    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {

        if kind == UICollectionView.elementKindSectionHeader {
            // swiftlint:disable:next line_length
            if let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind,
                                                                                withReuseIdentifier: PicturePassHeaderCollectionReusableView.nameOfClass,
                                                                                for: indexPath) as? PicturePassHeaderCollectionReusableView {

                if presenter.getIsLogin() {
                    headerView.setTitleLabelHidden(isHidden: true)
                    headerView.setTextLabelText(presenter.getLoggedInHeaderText())

                } else {
                    headerView.setTitleLabelHidden(isHidden: false)
                    headerView.setTextLabelText(presenter.getNotLoggedInHeaderText())
                }
                return headerView
            }
        }

        return UICollectionReusableView()
    }
}


// MARK: - UICollectionViewDelegateFlowLayout
extension PicturePassCollectionViewAdapter: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 106, height: 106)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {

        let indexPath = IndexPath(row: 0, section: section)
           let headerView = self.collectionView(collectionView,
                                                viewForSupplementaryElementOfKind:
                                                    UICollectionView.elementKindSectionHeader,
                                                at: indexPath)

           return headerView.systemLayoutSizeFitting(CGSize(width: collectionView.frame.width,
                                                            height: UIView.layoutFittingExpandedSize.height),
                                                     withHorizontalFittingPriority: .required,
                                                     verticalFittingPriority: .fittingSizeLevel)
    }

}
