import Foundation
import XCTest

public class BoatTests: XCTestCase {
    public func test_givenCroiseur_whenSize_thenReturnFour() {
        XCTAssertEqual(Boat.croiseur.size, 4)
    }
    
    public func test_givenEscorteur_whenSize_thenReturnThree() {
        XCTAssertEqual(Boat.escorteur.size, 3)
    }
    
    public func test_givenTorpilleur_whenSize_thenReturnTwo() {
        XCTAssertEqual(Boat.torpilleur.size, 2)
    }

    public func test_givenSousMarin_whenSize_thenReturnOne() {
        XCTAssertEqual(Boat.sousmarin.size, 1)
    }
}
