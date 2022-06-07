import Foundation

protocol AlertView {
    func showMessage(viewModel: AlertViewModel)
}

struct AlertViewModel: Equatable {
    var title: String
    var message: String

    init(title: String, message: String) {
        self.title = title
        self.message = message
    }
}
