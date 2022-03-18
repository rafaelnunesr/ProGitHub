//
//  ApiServiceMock.swift
//  InfraTests
//
//  Created by Rafael Nunes Rios on 3/18/22.
//

import Foundation
import RxSwift
import Data
import Infra

public class ApiServiceMock: HttpGetClient {
    
    static public let shared = ApiServiceMock()
    public var result: RepositoriesResults?
    
    public func fetchRepositories(withUrl url: URL) -> Observable<GithubRepositories> {
        
        return Observable.create { observer in
            switch self.result {
            case .success(let data):
                observer.onNext(data)
            case .failure(let error):
                observer.onError(error)
            default:
                observer.onError(HttpError.noConnectivity)
            }
            return Disposables.create()
        }
    }
}
