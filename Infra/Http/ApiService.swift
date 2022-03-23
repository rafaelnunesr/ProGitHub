//
//  ApiService.swift
//  Infra
//
//  Created by Rafael Nunes Rios on 3/16/22.
//

import Foundation
import RxSwift
import SwiftyJSON
import Data

public class ApiService {
    
    static public let shared = ApiService()

    private let repositoriesBaseURL = "https://api.github.com/search/repositories"
    private let pullRequestsBaseURL = "https://api.github.com/repos/"
    
    private func getData(withUrl url: URL) -> Observable<Data> {
        return Observable.create { observer in
            let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
                if let _error = error {
                    observer.onError(_error)
                }
                
                if let responseHttp = response as? HTTPURLResponse,
                   let _data = data {
                    switch responseHttp.statusCode {
                    case 200...299:
                        observer.onNext(_data)
                    case 401:
                        observer.onError(HttpError.unauthorized)
                    case 403:
                        observer.onError(HttpError.forbidden)
                    case 400...499:
                        observer.onError(HttpError.badRequest)
                    case 500...509:
                        observer.onError(HttpError.serverError)
                    default:
                        observer.onError(HttpError.noConnectivity)
                    }
                }
                observer.onCompleted()
            }
            task.resume()
            
            return Disposables.create {
                task.cancel()
            }
        }
    }

    public func fetchRepositories(language: String, page: Int) -> Observable<[GithubRepository]> {
        let url = "\(repositoriesBaseURL)?q=language:\(language)&sort=stars&page=\(page)"
        guard let safeURL = URL(string: url) else { return Observable.empty() }
        return getData(withUrl: safeURL).flatMap { [weak self] data -> Observable<[GithubRepository]> in
            guard let _ = self else { return Observable.empty() }
            guard let json = try? JSON(data: data) else {
                return Observable.error(HttpError.badRequest)
            }
            return Observable.just(GithubRepositoryParser.parseGithubRepository(with: json))
        }
    }
    
    public func fetchPullRequests(user: String, repository: String) -> Observable<GithubPullRequests> {
        let url = "\(pullRequestsBaseURL)\(user)" + "/" + "\(repository)" + "/" + "pulls"
        guard let safeURL = URL(string: url) else { return Observable.empty() }
        return getData(withUrl: safeURL).flatMap { [weak self] data -> Observable<GithubPullRequests> in
            guard let _ = self else { return Observable.empty() }
            guard let json = try? JSON(data: data) else {
                return Observable.error(HttpError.badRequest)
            }
            return Observable.just(GithubPullRequestParser.parseGithubPullRequest(with: json))
        }
    }

    public func fetchProfileImage(withUrl url: String) -> Observable<Data> {
        guard let safeURL = URL(string: url) else { return Observable.empty() }
        return getData(withUrl: safeURL)
    }
}
