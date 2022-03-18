//
//  GithubRepositoryParser.swift
//  Data
//
//  Created by Rafael Nunes Rios on 3/16/22.
//

import Foundation
import SwiftyJSON

public struct GithubRepositoryParser {
    public static func parseGithubRepositories(with json: JSON) -> GithubRepositories {
        return GithubRepositories(repositories: parseGithubRepository(with: json))
    }
    
    private static func parseGithubRepository(with json: JSON) -> [GithubRepository] {
        var repositories: [GithubRepository] = []
        
        if let repos = json["items"].array {
            
            for repo in repos {
                repositories.append(GithubRepository(id: repo["id"].intValue,
                                                     name: repo["name"].stringValue,
                                                     description: repo["description"].stringValue,
                                                     avatarUrl: repo["owner"]["avatar_url"].stringValue,
                                                     userUrl: repo["owner"]["url"].stringValue,
                                                     language: repo["language"].stringValue,
                                                     stargazers: repo["targazers_count"].intValue,
                                                     forks: repo["forks"].intValue,
                                                     login: repo["owner"]["login"].stringValue))
            }
        }
        
        return repositories
    }
}
