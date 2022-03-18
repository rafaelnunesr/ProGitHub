//
//  GithubRepository.swift
//  Data
//
//  Created by Rafael Nunes Rios on 3/15/22.
//

import Foundation

public protocol Model: Equatable {}

public struct GithubRepository: Model {
    public let id: Int
    public let name: String
    public let description: String
    public let avatarUrl: String
    public let userUrl: String
    public let language: String
    public let stargazers: Int
    public let forks: Int
    public let login: String
    
    public init(id: Int,
                name: String,
                description: String,
                avatarUrl: String,
                userUrl: String,
                language: String,
                stargazers: Int,
                forks: Int,
                login: String) {
        self.id = id
        self.name = name
        self.description = description
        self.avatarUrl = avatarUrl
        self.userUrl = userUrl
        self.language = language
        self.stargazers = stargazers
        self.forks = forks
        self.login = login
    }
}

public struct GithubRepositories: Model {
    public let repositories: [GithubRepository]
    
    public init(repositories: [GithubRepository]) {
        self.repositories = repositories
    }
}
