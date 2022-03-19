//
//  ApiService.swift
//  Infra
//
//  Created by Rafael Nunes Rios on 3/16/22.
//

import Foundation
import RxSwift
import Data
import SwiftyJSON

public class ApiService: HttpGetClient {
    
    static public let shared = ApiService()
    
    public func fetchRepositories(withUrl url: URL) -> Observable<GithubRepositories> {
        
        return Observable.create { observer in
            let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
                if let _error = error {
                    observer.onError(_error)
                }
                
                if let responseHttp = response as? HTTPURLResponse,
                   let _data = data {
                    switch responseHttp.statusCode {
                    case 200...299:
                        guard let json = try? JSON(data: _data) else {
                            observer.onError(HttpError.badRequest)
                            return
                        }
                        let dataParsed = GithubRepositoryParser.parseGithubRepositories(with: json)
                        observer.onNext(dataParsed)
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
}
