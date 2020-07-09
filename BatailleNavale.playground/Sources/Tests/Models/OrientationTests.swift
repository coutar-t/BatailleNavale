import Foundation
import XCTest

public class OrientationTests: XCTestCase {
    public func test_whenHorizontal_thenRawValueIsZero() {
        XCTAssertEqual(Orientation.horizontal.rawValue, 0)
    }

    public func test_whenVertical_thenRawValueIsOne() {
        XCTAssertEqual(Orientation.vertical.rawValue, 1)
    }
}

