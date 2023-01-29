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
    
    var marginForButtonTitle: String {
        return "   \(self)   "
    }
    
    func toDouble() -> Double? {
        guard let value = Double(self) else { return nil }
        return value
    }
    
    func toDate(dateFormat: String) -> Date {
        let formatter = DateFormatter()
        formatter.dateFormat = dateFormat
        if let date = formatter.date(from: self) {
            return date
        } else {
            return Date()
        }
    }
    
    func toFormattedDate(dateFormat: String, stringFormat: String) -> String {
        return self.toDate(dateFormat: dateFormat).toString(dateFormat: stringFormat)
    }
}
