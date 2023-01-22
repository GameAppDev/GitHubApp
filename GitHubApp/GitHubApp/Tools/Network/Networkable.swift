//
//  Networkable.swift
//  GitHubApp
//
//  Created by Oguzhan Yalcin on 21.01.2023.
//

import Foundation
import Alamofire

protocol Networkable {
    func get<T: Codable>(path: String,
                         paramaters: [String: String]?,
                         onSuccess: @escaping (BaseResponse<T>) -> Void,
                         onError: @escaping (BaseError) -> Void)
}
