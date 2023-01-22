//
//  String+Ext.swift
//  GitHubApp
//
//  Created by Oguzhan Yalcin on 21.01.2023.
//

import Foundation

extension String {
    
    var isNumeric: Bool {
        return CharacterSet(charactersIn: self).isSubset(of: CharacterSet.decimalDigits)
    }
    
    func toDouble() -> Double? {
        guard let value = Double(self) else { return nil }
        return value
    }
}
