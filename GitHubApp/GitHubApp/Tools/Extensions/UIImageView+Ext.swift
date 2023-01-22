//
//  UIImageView+Ext.swift
//  GitHubApp
//
//  Created by Oguzhan Yalcin on 22.01.2023.
//

import UIKit
import Kingfisher

extension UIImageView {
    
    func downloadImage(imageKey: String?, defaultImage: String) {
        guard let key = imageKey,
              let imageUrl = URL(string: key) else {
            self.image = UIImage(named: defaultImage)
            return
        }
        DispatchQueue.main.async {
            let resource = ImageResource(downloadURL: imageUrl)
            
            self.kf.indicatorType = .activity
            self.kf.setImage(with: resource,
                             placeholder: UIImage(named: defaultImage),
                             options: [.scaleFactor(UIScreen.main.scale),
                                       .cacheOriginalImage]) { result in
                switch result {
                case .success(let value):
                    debugPrint("<--- Image: \(value.image) - Got from: \(value.cacheType) --->")
                case .failure(let error):
                    debugPrint("<---! Download Image Error: \(error) !--->")
                    self.image = UIImage(named: defaultImage)
                }
            }
        }
    }
}
