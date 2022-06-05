import Foundation

class UrlProtocolStub: URLProtocol {
    static var emit: ((URLRequest) -> Void)?

    static func observerRequest(completion: @escaping (URLRequest) -> Void) {
        UrlProtocolStub.emit = completion
    }

    open override class func canInit(with request: URLRequest) -> Bool {
        return true
    }

    open override class func canonicalRequest(for request: URLRequest) -> URLRequest {
        return request
    }

    open override func startLoading() {
        UrlProtocolStub.emit?(request)
    }

    open override func stopLoading() { }
}
