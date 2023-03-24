import Foundation
import UI
import Presentation
import Validation
import Domain

public final class SignUpComposer {
    static func composeControllerWith(addAccount: AddAccount) -> SignUpViewController {
        let controller = SignUpViewController.instanciate()
        let emailValidatorAdapter = EmailValidatorAdapter()
        let presenter = SignUpPresenter(
            alertView: WeakVarProxy(controller),
            emailValidator: emailValidatorAdapter,
            addAccount: addAccount,
            loadingView: WeakVarProxy(controller)
        )
        controller.signUp = presenter.signUp
        
        return controller
    }
}
