//
//  Double+Ext.swift
//  GitHubApp
//
//  Created by Oguzhan Yalcin on 22.01.2023.
//

import Foundation

extension Double {
    
    func toString(fractions: Int = 2) -> String {
        return NumberFormatter().string(from: NSNumber(value: self)) ?? String(format: "%.\(fractions)f", self)
    }
}
