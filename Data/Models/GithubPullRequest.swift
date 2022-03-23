//
//  GithubPullRequest.swift
//  Data
//
//  Created by Rafael Nunes Rios on 3/18/22.
//

import Foundation

public struct GithubPullRequest: Model {
    public let title: String
    public let description: String
    public let pullRequestLink: String
    public let isOpen: Bool
    public let ownerAvatarUrl: String
    public let ownerNickname: String
    public let repositoryOwnerType: String
    
    public init(title: String,
                description: String,
                pullRequestLink: String,
                isOpen: Bool,
                ownerAvatarUrl: String,
                ownerNickname: String,
                repositoryOwnerType: String) {
        self.title = title
        self.description = description
        self.pullRequestLink = pullRequestLink
        self.isOpen = isOpen
        self.ownerAvatarUrl = ownerAvatarUrl
        self.ownerNickname = ownerNickname
        self.repositoryOwnerType = repositoryOwnerType
        
    }
}

public struct GithubPullRequests: Model {
    public let pullRequests: [GithubPullRequest]
    public let totalOpen: Int
    public let totalClosed: Int
    
    public init(pullRequests: [GithubPullRequest], totalOpen: Int, totalClosed: Int) {
        self.pullRequests = pullRequests
        self.totalOpen = totalOpen
        self.totalClosed = totalClosed
    }
}
