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
                
                if let _data = data, let json = try? JSON(data: _data) {
                    let dataParsed = GithubRepositoryParser.parseGithubRepositories(with: json)
                    observer.onNext(dataParsed)
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

//public class ApiService {
//
//    static public let shared = ApiService()
//
//    public func fetchRepositories(withUrl url: URL) -> Observable<Data> {
//
//           return Observable.create { observer -> Disposable in
//
//               let task = URLSession.shared.dataTask(with: url) { data, _, _ in
//
//                   guard let data = data else {
//                       observer.onError(NSError(domain: "", code: -1, userInfo: nil))
//                       return
//                   }
//
//                   do {
//
//                       observer.onNext(data)
//                   } catch {
//                       observer.onError(error)
//                   }
//               }
//               task.resume()
//               return Disposables.create{
//                   task.cancel()
//               }
//           }
//       }
//
//}


