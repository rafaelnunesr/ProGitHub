//
//  HttpGetClient.swift
//  Infra
//
//  Created by Rafael Nunes Rios on 3/15/22.
//

import Foundation
import RxSwift
import Data

public protocol HttpGetClient {
    func fetchRepositories(withUrl: URL) -> Observable<GithubRepository>
}
