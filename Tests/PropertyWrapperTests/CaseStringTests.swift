import XCTest
@testable import PropertyWrapper

final class CaseStringTests: XCTestCase {
    func testUppercase() {
        @UppercaseString var target: String
        var origin: String
        origin = "hello"
        target = origin
        XCTAssertTrue(target == origin.uppercased())
    }
    func testLowercase() {
        @LowercaseString var target: String
        var origin: String
        origin = "OPEN THE DOOR"
        target = origin
        XCTAssertTrue(target == origin.lowercased())
    }
}
