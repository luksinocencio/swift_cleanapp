import XCTest

@testable import Domain

class RemoteAddAccount {
    private let url: URL
    private let httpClient: HttpPostClient
    
    init(url: URL, httpClient: HttpPostClient) {
        self.url = url
        self.httpClient = httpClient
    }
    
    func add() {
        httpClient.post(url: url)
    }
}

protocol HttpPostClient {
    func post(url: URL)
}

/**
 - All tests have to start name with test
 */
class RemoteAddAccountTests: XCTestCase {
    
    func test_add_should_call_httpClient_with_correct_utl() {
        // prepare data
        guard let url = URL(string: "http://any-url.com") else { return }
        let httpClientSpy = HttpClientSpy()
        
        /// sut ->  system under test
        let sut = RemoteAddAccount(url: url, httpClient: httpClientSpy)
        
        /// call test
        sut.add()
        
        /// result test
        XCTAssertEqual(httpClientSpy.url, url)
    }
    
    /// spy -> versão mockado do que precisamos
    class HttpClientSpy: HttpPostClient {
        var url: URL?
        
        func post(url: URL) {
            self.url = url
        }
    }
}
