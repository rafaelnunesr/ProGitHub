//
//  GithubRepositoryParser.swift
//  Data
//
//  Created by Rafael Nunes Rios on 3/16/22.
//

import Foundation
import SwiftyJSON

public struct GithubRepositoryParser {
    public static func parseUserName(with json: JSON) -> String {
        return json[""].stringValue
    }

    public static func parseGithubRepository(with json: JSON) -> [GithubRepository] {
        var repositories: [GithubRepository] = []
        
        if let repos = json["items"].array {
            
            for repo in repos {
                repositories.append(GithubRepository(id: repo["id"].intValue,
                                                     name: repo["name"].stringValue,
                                                     description: repo["description"].stringValue,
                                                     language: repo["language"].stringValue,
                                                     stars: repo["stargazers_count"].intValue,
                                                     forks: repo["forks"].intValue,
                                                     ownerUserAvatarUrl: repo["owner"]["avatar_url"].stringValue,
                                                     ownerUserUrl: repo["owner"]["url"].stringValue,
                                                     ownerNickname: repo["owner"]["login"].stringValue,
                                                     repositoryOwnerType: repo["owner"]["type"].stringValue))
            }
        }
        
        return repositories
    }
}
