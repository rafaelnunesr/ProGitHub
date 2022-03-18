//
//  ApiServiceTests.swift
//  InfraTests
//
//  Created by Rafael Nunes Rios on 3/16/22.
//

import XCTest
import Infra
import RxSwift
import Data

class ApiServiceTests: XCTestCase {
    
    fileprivate let disposeBag = DisposeBag()
    
    func test_get_should_make_request_with_valid_url_and_method() {
        let url = makeURL()
        let exp = expectation(description: "waiting")
        testRequestForRepositories(withUrl: url, withResult: .success(makeGihubRepositoriesMock()))
            .subscribe(
                onNext: { result in
                    XCTAssertEqual(result, makeGihubRepositoriesMock())
                    exp.fulfill()
                }
            ).disposed(by: disposeBag)
        
        wait(for: [exp], timeout: 1)
    }
    
    func test_requests_possible_errors() {
        testRequestRepositoriesWithError(withError: .badRequest)
        testRequestRepositoriesWithError(withError: .noConnectivity)
        testRequestRepositoriesWithError(withError: .forbidden)
        testRequestRepositoriesWithError(withError: .serverError)
        testRequestRepositoriesWithError(withError: .unauthorized)
    }
}

extension ApiServiceTests {
    func makeSut(file: StaticString = #filePath, line: UInt = #line) -> ApiServiceMock {
        let sut = ApiServiceMock.shared
        return sut
    }
    
    func testRequestForRepositories(withUrl url: URL, withResult result: RepositoriesResults) -> Observable<GithubRepositories> {
        let sut = makeSut()
        sut.result = result
        return sut.fetchRepositories(withUrl: url)
    }
    
    func testRequestRepositoriesWithError(withError error: HttpError, file: StaticString = #filePath, line: UInt = #line) {
        let exp = expectation(description: "waiting")
        testRequestForRepositories(withUrl: makeURL(), withResult: .failure(error))
            .subscribe(
                onNext: { result in
                    XCTFail("This request should return a request error.", file: file, line: line)
                    exp.fulfill()
                },
                onError: { receivedError in
                    XCTAssertEqual(receivedError as? HttpError, error, file: file, line: line)
                    exp.fulfill()
                }
            ).disposed(by: disposeBag)
        
        wait(for: [exp], timeout: 1)
    }
}
