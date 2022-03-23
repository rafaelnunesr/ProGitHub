//
//  GithubRepository.swift
//  Data
//
//  Created by Rafael Nunes Rios on 3/15/22.
//

import Foundation

public protocol Model: Equatable {}

public enum RepositoryOwnerType {
    case user
    case organization
    case other
}

public struct GithubRepository: Model {
    public let id: Int
    public let name: String
    public let description: String
    public let language: String
    public let stars: Int
    public let forks: Int
    public let ownerUserAvatarUrl: String
    public let ownerUserUrl: String
    public let ownerNickname: String
    public let repositoryOwnerType: String
    
    public init(id: Int,
                name: String,
                description: String,
                language: String,
                stars: Int,
                forks: Int,
                ownerUserAvatarUrl: String,
                ownerUserUrl: String,
                ownerNickname: String,
                repositoryOwnerType: String) {
        self.id = id
        self.name = name
        self.description = description
        self.language = language
        self.stars = stars
        self.forks = forks
        self.ownerUserAvatarUrl = ownerUserAvatarUrl
        self.ownerUserUrl = ownerUserUrl
        self.ownerNickname = ownerNickname
        self.repositoryOwnerType = repositoryOwnerType
    }
}
