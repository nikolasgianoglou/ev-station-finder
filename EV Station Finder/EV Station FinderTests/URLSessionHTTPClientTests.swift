//
//  URLSessionHTTPClientTests.swift
//  EV Station FinderTests
//
//  Created by Nikolas Gianoglou on 24/06/25.
//

@testable import EV_Station_Finder
import Foundation
import XCTest

final class URLSessionHTTPClientTests: XCTestCase {
    func test_getFromURL_performsGETRequestWithCorrectURL() {
        let url = URL(string: "https://example.com")!
        let session = URLSessionSpy()
        let sut = URLSessionHTTPClient(session: session)

        sut.get(from: url) { _ in }

        XCTAssertEqual(session.lastRequestedURL, url)
    }

    func test_getFromURL_failsOnRequestError() {
        let session = URLSessionSpy()
        let sut = URLSessionHTTPClient(session: session)

        let expectedError = NSError(domain: "Test", code: 123)
        session.completionHandler?(nil, nil, expectedError)

        sut.get(from: URL(string: "https://example.com")!) { result in
            switch result {
            case let .failure(error as NSError):
                XCTAssertEqual(error.code, expectedError.code)
            default:
                XCTFail("Expected failure, got \(result)")
            }
        }
    }

    func test_getFromURL_succeedsOnHTTPResponseWithData() {
        let session = URLSessionSpy()
        let sut = URLSessionHTTPClient(session: session)

        let expectedData = Data("".utf8)
        let expectedResponse = HTTPURLResponse(url: URL(string: "https://example.com")!,
                                               statusCode: 200, httpVersion: nil, headerFields: nil)!

        var receivedData: Data?
        var receivedResponse: HTTPURLResponse?

        sut.get(from: expectedResponse.url!) { result in
            if case let .success(data, response) = result {
                receivedData = data
                receivedResponse = response
            } else {
                XCTFail("Expected success, got \(result)")
            }
        }

        session.completionHandler?(expectedData, expectedResponse, nil)

        XCTAssertEqual(receivedData, expectedData)
        XCTAssertEqual(receivedResponse?.statusCode, expectedResponse.statusCode)
    }
}

// MARK: - Spy
final class URLSessionSpy: URLSession {
    var lastRequestedURL: URL?
    var completionHandler: ((Data?, URLResponse?, Error?) -> Void)?

    override func dataTask(with url: URL, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        self.lastRequestedURL = url
        self.completionHandler = completionHandler
        return DummyDataTask()
    }

    private final class DummyDataTask: URLSessionDataTask {
        override func resume() { }
    }
}
