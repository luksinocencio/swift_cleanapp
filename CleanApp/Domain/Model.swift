import Foundation

public protocol Model: Codable { }

extension Model {
    func toData() -> Data? {
        try? JSONEncoder().encode(self)
    }
}
