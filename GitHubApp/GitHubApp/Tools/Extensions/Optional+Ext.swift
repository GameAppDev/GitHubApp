//
//  Optional+Ext.swift
//  GitHubApp
//
//  Created by Oguzhan Yalcin on 21.01.2023.
//

import Foundation

extension Optional where Wrapped == String {
    
    var orEmpty: String {
        self ?? ""
    }
}

extension Optional where Wrapped == Int {
    
    var orEmpty: Int {
        self ?? 0
    }
}
