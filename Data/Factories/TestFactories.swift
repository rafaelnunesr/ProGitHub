//
//  TestFactories.swift
//  Data
//
//  Created by Rafael Nunes Rios on 3/18/22.
//

import Foundation
import Data

func makeURL() -> URL {
    return URL(string: "https://any-url.com")!
}

func makeGihubRepositoriesMock() -> GithubRepositories {
    var repositories: [GithubRepository] = []
    
    repositories.append(GithubRepository(id: 1,
                                         name: "some repository",
                                         description: "just another repository",
                                         userAvatarUrl: "https://some-link.com",
                                         userUrl: "https://another-link.com",
                                         language: "Fortrain",
                                         stargazers: 200,
                                         forks: 400,
                                         login: "just a login"))
    
    return GithubRepositories(repositories: repositories)
}

