import Foundation

@testable import Presentation
@testable import Data
@testable import Domain

public class AddAccountSpy: AddAccount {
    var addAccountModel: AddAccountModel?
    var completion: ((Result<AccountModel, DomainError>) -> Void)?

    public func add(addAccountModel: AddAccountModel, completion: @escaping (Result<AccountModel, DomainError>) -> Void) {
        self.addAccountModel = addAccountModel
        self.completion = completion
    }

    public func completeWithError(_ error: DomainError) {
        completion?(.failure(error))
    }

    public func completeWithAccount(_ account: AccountModel) {
        completion?(.success(account))
    }
}
