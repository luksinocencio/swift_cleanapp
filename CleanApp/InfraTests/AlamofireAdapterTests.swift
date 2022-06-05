import Alamofire
import XCTest

@testable import Data
@testable import Domain

class AlamofireAdapterTests: XCTestCase {
    func test_post_should_make_request_with_valid_url_and_method() {
        let url = makeUrl()
        testRequestFor(url: url, data: makeValidData()) { request in
            XCTAssertEqual(url, request.url)
            XCTAssertEqual("POST", request.httpMethod)
            XCTAssertNotNil(request.httpBodyStream)
        }
    }

    func test_post_should_make_request_with_no_data() {
        testRequestFor(data: nil) { request in
            XCTAssertNil(request.httpBodyStream)
        }
    }

    func test_post_should_complete_with_error_when_request_completes_with_error() {
        let sut = makeSut()
        UrlProtocolStub.simulate(data: nil, response: nil, error: makeError())
        let exp = expectation(description: "waiting")
        sut.post(to: makeUrl(), with: makeValidData()) { result in
            switch result {
            case .failure(let error): XCTAssertEqual(error, .noConnectivity)
            case .success: XCTFail("Expected error got \(result) instead")
            }
            exp.fulfill()
        }
        wait(for: [exp], timeout: 1)
    }
}

extension AlamofireAdapterTests {
    func makeSut(file: StaticString = #file, line: UInt = #line) -> AlamofireAdapter {
        let configuration = URLSessionConfiguration.default
        configuration.protocolClasses = [UrlProtocolStub.self]
        let session = Session(configuration: configuration)
        let sut = AlamofireAdapter(session: session)
        checkMemoryLeak(for: sut, file: file, line: line)
        return sut
    }

    func testRequestFor(url: URL = makeUrl(), data: Data?, action: @escaping (URLRequest) -> Void) {
        let sut = makeSut()
        let exp = expectation(description: "waiting")
        sut.post(to: url, with: data) { _ in  exp.fulfill() }
        var request: URLRequest?
        UrlProtocolStub.observerRequest { request = $0 }
        wait(for: [exp], timeout: 1)
        action(request!)
    }
}
