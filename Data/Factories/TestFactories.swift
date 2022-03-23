//
//  TestFactories.swift
//  Data
//
//  Created by Rafael Nunes Rios on 3/18/22.
//

import Foundation
import Data

func makeValidUrlAsString() -> String {
    return "https://any-url.com"
}

func makeGihubRepositoriesMock() -> [GithubRepository] {
    var repositories: [GithubRepository] = []
    
    repositories.append(GithubRepository(id: 1,
                                         name: "some repository",
                                         description: "just another repository",
                                         language: "Fortrain",
                                         stars: 200,
                                         forks: 100,
                                         ownerUserAvatarUrl: "https://some-link.com",
                                         ownerUserUrl: "https://another-link.com",
                                         ownerNickname: "Club",
                                         repositoryOwnerType: "User"))
    
    return repositories
}
