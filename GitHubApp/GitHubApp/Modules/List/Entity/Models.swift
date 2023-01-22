//
//  Models.swift
//  GitHubApp
//
//  Created by Oguzhan Yalcin on 21.01.2023.
//

import UIKit

struct RepoResponse: Codable {
    let id: Double?
    let nodeId: String?
    let name: String?
    let fullName: String?
    let owner: RepoOwner?
    let description: String?
    let gitUrl: String?
    let createdAt: String?
    let updatedAt: String?
    let pushedAt: String?
    let watchersCount: Int?
    let language: String?
    let license: RepoLicense?
    let topics: [String]?
    let visibility: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case nodeId = "node_id"
        case name
        case fullName = "full_name"
        case owner
        case description
        case gitUrl = "git_url"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case pushedAt = "pushed_at"
        case watchersCount = "watchers_count"
        case language
        case license
        case topics
        case visibility
    }
}

struct RepoOwner: Codable {
    let id: Double?
    let nodeId: String?
    let avatarUrl: String?
    let reposUrl: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case nodeId = "node_id"
        case avatarUrl = "avatar_url"
        case reposUrl = "repos_url"
    }
}

struct RepoLicense: Codable {
    let key: String?
    let name: String?
    let pdxId: String?
    let url: String?
    let nodeId: String?
    
    enum CodingKeys: String, CodingKey {
        case key
        case name
        case pdxId = "pdx_id"
        case url
        case nodeId = "node_id"
    }
}

// MARK: - Custom Model
struct CustomRepositoryModel {
    let id: String
    let fullName: String
    let description: String
    let avatarUrl: String
    let createdAt: String
    let updatedAt: String
    let pushedAt: String
    let reposUrl: String
    let licenseUrl: String
    let watchersCount: String
    let language: String
    let visibilityStatus: VisibilityStatus
    
    init(repoResponse: RepoResponse) {
        self.id = repoResponse.id?.toString(fractions: 0) ?? ""
        self.fullName = repoResponse.fullName.orEmpty
        self.description = repoResponse.description.orEmpty
        self.avatarUrl = repoResponse.owner?.avatarUrl ?? ""
        self.createdAt = repoResponse.createdAt.orEmpty
        self.updatedAt = repoResponse.updatedAt.orEmpty
        self.pushedAt = repoResponse.pushedAt.orEmpty
        self.reposUrl = repoResponse.owner?.reposUrl ?? ""
        self.licenseUrl = repoResponse.license?.url ?? ""
        self.watchersCount = repoResponse.watchersCount?.toString() ?? "0"
        self.language = repoResponse.language.orEmpty
        self.visibilityStatus = VisibilityStatus(rawValue: repoResponse.visibility ?? VisibilityStatus.all.rawValue) ?? .all
    }
    
    init(coreDataModel: Repository) {
        self.id = coreDataModel.id.orEmpty
        self.fullName = coreDataModel.fullName.orEmpty
        self.description = coreDataModel.desc.orEmpty
        self.avatarUrl = coreDataModel.avatarUrl.orEmpty
        self.createdAt = coreDataModel.createdAt.orEmpty
        self.updatedAt = coreDataModel.updatedAt.orEmpty
        self.pushedAt = coreDataModel.pushedAt.orEmpty
        self.reposUrl = coreDataModel.reposUrl.orEmpty
        self.licenseUrl = coreDataModel.licenseUrl.orEmpty
        self.watchersCount = coreDataModel.watchersCount.orEmpty
        self.language = coreDataModel.language.orEmpty
        self.visibilityStatus = VisibilityStatus(rawValue: coreDataModel.visibilityStatusRawValue ?? VisibilityStatus.all.rawValue) ?? .all
    }
}

// MARK: - For Filter
enum VisibilityStatus: String, CaseIterable {
    case all = "all"
    case publicState = "public"
    case privateState = "private"
    case forksState = "forks"
    case sourcesState = "sources"
    case memberState = "member"
    
    var stateColour: UIColor {
        switch self {
        case .all:
            return UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
        case .publicState:
            return UIColor(red: 150/255, green: 150/255, blue: 200/255, alpha: 1)
        case .privateState:
            return UIColor(red: 220/255, green: 150/255, blue: 150/255, alpha: 1)
        case .forksState:
            return UIColor(red: 175/255, green: 175/255, blue: 175/255, alpha: 1)
        case .sourcesState:
            return UIColor(red: 60/255, green: 60/255, blue: 60/255, alpha: 1)
        case .memberState:
            return UIColor(red: 180/255, green: 170/255, blue: 100/255, alpha: 1)
        }
    }
}

// MARK: - For Sort
enum SortStatus: String, CaseIterable {
    case byFullName = "FullName"
    case byCreatedAt = "CreatedAt"
    case byUpdatedAt = "UpdatedAt"
    case byPushedAt = "PushedAt"
}
