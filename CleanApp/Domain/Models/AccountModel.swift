import Foundation

public struct AccountModel: Model {
    var id: String
    var name: String
    var email: String
    var password: String
    var accessToken: String

    public init(id: String, name: String, email: String, password: String, accessToken: String) {
        self.id = id
        self.name = name
        self.email = email
        self.password = password
        self.accessToken = accessToken
    }
}
