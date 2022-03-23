//
//  PullRequestsViewModel.swift
//  ProGitHub
//
//  Created by Rafael Nunes Rios on 3/21/22.
//

import Foundation
import RxSwift
import Data
import Infra

class PullRequestsViewModel {
    public var pullRequests: GithubPullRequests?
    
    func fetchPullRequests(user: String, repository: String) -> Observable<Void> {
        return ApiService.shared.fetchPullRequests(user: user, repository: repository).map { [weak self] pullRequests in
            guard let self = self else { return }
            self.pullRequests = pullRequests
        }
    }
}
