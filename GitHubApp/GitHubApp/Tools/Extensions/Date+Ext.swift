//
//  Date+Ext.swift
//  GitHubApp
//
//  Created by Oguzhan Yalcin on 29.01.2023.
//

import Foundation

extension Date {
    
    func toString(dateFormat format: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }
}
