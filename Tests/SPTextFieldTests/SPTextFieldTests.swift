import XCTest
@testable import SPTextField

final class SPTextFieldTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(SPTextField().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
