//
//  NetworkManager.swift
//  GitHubApp
//
//  Created by Oguzhan Yalcin on 21.01.2023.
//

import Foundation
import Alamofire

typealias Success<T: Codable> = (BaseResponse<T>) -> Void
typealias Error = (BaseError) -> Void

final class NetworkManager: Networkable {
    
    func get<T>(path: String, _ paramaters: [String: String]?, onSuccess: @escaping (BaseResponse<T>) -> Void, onError: @escaping (BaseError) -> Void) where T: Decodable, T: Encodable {
        AF.request(networkRequestUrlWith(path), method: .get, parameters: paramaters).validate().responseDecodable(of: T.self) { response in
            guard let model = response.value else {
                onError(BaseError(response.error))
                return
            }
            onSuccess(BaseResponse.init(model: model, message: "SUCCESS"))
        }
    }
}

extension NetworkManager {
    
    private func networkRequestUrlWith(_ path: String) -> String {
        return "https://api.github.com/" + path
    }
}
