import Foundation

public extension Data {
    func toModel<T: Codable>() -> T? {
        try? JSONDecoder().decode(T.self, from: self)
    }
}
