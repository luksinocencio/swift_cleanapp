import XCTest
@testable import Main

final class SignUpIntegrationTests: XCTestCase {
    func testExample() {
        let sut = SignUpComposer.composeControllerWith(addAccount: AddAccountSpy())
        checkMemoryLeak(for: sut)
    }
}
