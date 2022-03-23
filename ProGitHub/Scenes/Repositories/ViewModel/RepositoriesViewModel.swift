//
//  RepositoriesViewModel.swift
//  ProGitHub
//
//  Created by Rafael Nunes Rios on 3/20/22.
//

import Foundation
import RxSwift
import Data
import Infra

class RepositoriesViewModel {
    public var repositories: [GithubRepository] = []
    public var lastPageCalled: Int = 0
    public var selectedLanguage: String = ""
    
    init(language: String) {
        self.selectedLanguage = language
    }
    
    public func fetchRepositories(page: Int) -> Observable<Void> {
        return ApiService.shared.fetchRepositories(language: selectedLanguage, page: page).map { [weak self] repositories in
            guard let self = self else { return }
            self.lastPageCalled = page
            self.repositories += repositories
        }
    }
}
