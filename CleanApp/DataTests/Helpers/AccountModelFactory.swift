import Foundation
import Domain

func makeAccountModel() -> AccountModel {
    AccountModel(id: "id_any", name: "any_name", email: "any_email@mail.com", password: "any_password", accessToken: "any_token")
}
