import Foundation
import Domain

public func makeAccountModel() -> AccountModel {
    return AccountModel(id: "id_any", name: "any_name", email: "any_email@mail.com", password: "any_password", accessToken: "any_token")
}

public func makeAddAccountModel() -> AddAccountModel {
   return AddAccountModel(name: "any_name", email: "any_email@mail.com", password: "any_password", passwordConfirmation: "any_password")
}
