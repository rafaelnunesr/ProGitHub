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
        
        
        return requests
    }
    
}
