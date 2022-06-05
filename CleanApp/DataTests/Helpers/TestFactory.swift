import Foundation

func makeInvalidData() -> Data {
    Data("invalid_data".utf8)
}

func makeValidData() -> Data {
    Data("{\"name\":\"Lucas\"}".utf8)
}

func makeUrl() -> URL {
    URL(string: "http://any-url.com")!
}

func makeError() -> Error {
    NSError(domain: "any_error", code: 0)
}
