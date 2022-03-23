//
//  NavigationTableViewDelegate.swift
//  ProGitHub
//
//  Created by Rafael Nunes Rios on 3/21/22.
//

import Foundation
import Data

protocol NavigationTableViewDelegate: class {
    func showDetail(repo: GithubRepository)
    func fetchNewData()
}
