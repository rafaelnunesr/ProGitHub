//
//  GithubPullRequest.swift
//  Data
//
//  Created by Rafael Nunes Rios on 3/18/22.
//

import Foundation

public struct GithubPullRequest: Model {
    let title: String
    let description: String
    let userAvatarUrl: String
    let userName: String
    let userFullName: String
    let isOpen: Bool
    
    public init(title: String,
                description: String,
                isOpen: Bool,
                userAvatarUrl: String,
                userName: String,
                userFullName: String) {
        self.title = title
        self.description = description
        self.isOpen = isOpen
        self.userAvatarUrl = userAvatarUrl
        self.userName = userName
        self.userFullName = userFullName
        
    }
}

public struct GithubPullRequests: Model {
    let pullRequests: [GithubPullRequest]
    let totalOpen: Int
    let totalClosed: Int
    
    public init(pullRequests: [GithubPullRequest], totalOpen: Int, totalClosed: Int) {
        self.pullRequests = pullRequests
        self.totalOpen = totalOpen
        self.totalClosed = totalClosed
    }
}
