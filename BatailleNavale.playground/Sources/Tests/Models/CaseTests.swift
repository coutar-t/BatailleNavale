import Foundation
import XCTest

public class CaseTests: XCTestCase {
    public func test_givenBoatCroiseur_whenFromBoat_thenReturnCroiseur() {
        XCTAssertEqual(Case.fromBoat(.croiseur), .croiseur)
    }

    public func test_givenBoatEscorteur_whenFromBoat_thenReturnEscorteur() {
        XCTAssertEqual(Case.fromBoat(.escorteur), .escorteur)
    }

    public func test_givenBoatSousMarin_whenFromBoat_thenReturnSousMarin() {
        XCTAssertEqual(Case.fromBoat(.sousmarin), .sousmarin)
    }

    public func test_givenBoatTorpilleur_whenFromBoat_thenReturntorpilleur() {
        XCTAssertEqual(Case.fromBoat(.torpilleur), .torpilleur)
    }

}
