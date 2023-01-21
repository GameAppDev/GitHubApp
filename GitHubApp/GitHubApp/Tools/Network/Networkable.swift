//
//  Networkable.swift
//  GitHubApp
//
//  Created by Oguzhan Yalcin on 21.01.2023.
//

import Foundation

protocol Networkable {
    func get<T: Codable>(path: String, _ paramaters: [String: String]?,
                         onSuccess: @escaping (BaseResponse<T>) -> Void,
                         onError: @escaping (BaseError) -> Void)
}
