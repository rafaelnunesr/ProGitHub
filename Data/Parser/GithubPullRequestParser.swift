//
//  GithubPullRequestParser.swift
//  Data
//
//  Created by Rafael Nunes Rios on 3/18/22.
//

import Foundation
import SwiftyJSON

public struct GithubPullRequestParser {
    
    public static func parseGithubPullRequest(with json: JSON) -> GithubPullRequests {
        return GithubPullRequests(pullRequests: parseGithubPullRequest(with: json),
                                  totalOpen: 5,
                                  totalClosed: 20)
    }
    
    private static func parseGithubPullRequest(with json: JSON) -> [GithubPullRequest] {
        var requests: [GithubPullRequest] = []
        
        if let pulls = json.array {
            for pull in pulls {
                requests.append(GithubPullRequest(title: pull["title"].stringValue,
                                                  description: pull["body"].stringValue,
                                                  pullRequestLink: pull["html_url"].stringValue,
                                                  isOpen: isPullOpen(state: pull["state"].stringValue),
                                                  ownerAvatarUrl: pull["user"]["avatar_url"].stringValue,
                                                  ownerNickname: pull["user"]["login"].stringValue,
                                                  repositoryOwnerType: pull["user"]["type"].stringValue))
            }
        }
        
        return requests
    }
    
    private static func isPullOpen(state: String) -> Bool {
        return state.lowercased() == "open" ? true : false
    }
    
}
