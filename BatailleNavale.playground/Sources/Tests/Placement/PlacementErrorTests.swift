import Foundation
import XCTest

public class PlacementErrorTests: XCTestCase {
    public func test_givenNoMoreSpace_whenErrorDescription_thenReturnNoMoreSpace() {
        XCTAssertEqual(PlacementError.noMoreSpace.errorDescription, "No more space available in the board.")
    }
}
