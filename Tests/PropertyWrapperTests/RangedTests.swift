import XCTest
@testable import PropertyWrapper

final class RangedTests: XCTestCase {
    @Ranged(upper: 100, lower: 0) var counter: Int = 50
    func testUpper() {
        counter = 200
        XCTAssertTrue(counter == 100)
        counter = 50
        counter = 100
        XCTAssertTrue(counter == 100)
    }
    func testLower() {
        counter = -100
        XCTAssertTrue(counter == 0)
        counter = 50
        counter = 0
        XCTAssertTrue(counter == 0)
    }
    func testAssign() {
        counter = 75
        XCTAssertTrue(counter == 75)
    }
}
