import Foundation
import XCTest

public class PlacementRulesTests: XCTestCase {
    var sut: PlacementRules!
    
    public override func setUp() {
        super.setUp()
        
        sut = PlacementRules()
    }
    
    public func test_givenHorizontal_andBoatLargerThanBoard_whenCanBePlaceIn_thenReturnFalse() {
        
        // When
        
        let result = sut.canBePlaceIn(position: Position(x: 0, y: 0), size: 4, orientation: .horizontal, in: [[Case.water]])
        
        // Then
        
        XCTAssertFalse(result)
    }
    
    public func test_givenVertical_andBoatLargerThanBoard_whenCanBePlaceIn_thenReturnFalse() {
        
        // When
        
        let result = sut.canBePlaceIn(position: Position(x: 0, y: 0), size: 4, orientation: .horizontal, in: [[Case.water]])
        
        // Then
        
        XCTAssertFalse(result)
    }
    
    public func test_givenHorizontal_andBoatInMiddleOfBoard_whenCanBePlaceIn_thenReturnTrue() {
        
        // When
        
        let result = sut.canBePlaceIn(position: Position(x: 1, y: 1),
                                      size: 1,
                                      orientation: .horizontal,
                                      in: [[Case.water, Case.water, Case.water],
                                           [Case.water, Case.water, Case.water],
                                           [Case.water, Case.water, Case.water]])
        
        // Then
        
        XCTAssertTrue(result)
    }
    
    public func test_givenHorizontal_andBoatInLeftOfBoard_whenCanBePlaceIn_thenReturnTrue() {
        
        // When
        
        let result = sut.canBePlaceIn(position: Position(x: 1, y: 0),
                                      size: 1,
                                      orientation: .horizontal,
                                      in: [[Case.water, Case.water, Case.water],
                                           [Case.water, Case.water, Case.water],
                                           [Case.water, Case.water, Case.water]])
        
        // Then
        
        XCTAssertTrue(result)
    }
    
    public func test_givenHorizontal_andBoatInRightOfBoard_whenCanBePlaceIn_thenReturnTrue() {
        
        // When
        
        let result = sut.canBePlaceIn(position: Position(x: 1, y: 2),
                                      size: 1,
                                      orientation: .horizontal,
                                      in: [[Case.water, Case.water, Case.water],
                                           [Case.water, Case.water, Case.water],
                                           [Case.water, Case.water, Case.water]])
        
        // Then
        
        XCTAssertTrue(result)
    }
    
    public func test_givenHorizontal_andBoatInTopOfBoard_whenCanBePlaceIn_thenReturnTrue() {
        
        // When
        
        let result = sut.canBePlaceIn(position: Position(x: 0, y: 1),
                                      size: 1,
                                      orientation: .horizontal,
                                      in: [[Case.water, Case.water, Case.water],
                                           [Case.water, Case.water, Case.water],
                                           [Case.water, Case.water, Case.water]])
        
        // Then
        
        XCTAssertTrue(result)
    }

    public func test_givenHorizontal_andBoatInBottomOfBoard_whenCanBePlaceIn_thenReturnTrue() {
        
        // When
        
        let result = sut.canBePlaceIn(position: Position(x: 2, y: 1),
                                      size: 1,
                                      orientation: .horizontal,
                                      in: [[Case.water, Case.water, Case.water],
                                           [Case.water, Case.water, Case.water],
                                           [Case.water, Case.water, Case.water]])
        
        // Then
        
        XCTAssertTrue(result)
    }

    public func test_givenHorizontal_andBoatInLeftOfBoard_andSizeEqualToBoard_whenCanBePlaceIn_thenReturnTrue() {
        
        // When
        
        let result = sut.canBePlaceIn(position: Position(x: 1, y: 0),
                                      size: 3,
                                      orientation: .horizontal,
                                      in: [[Case.water, Case.water, Case.water],
                                           [Case.water, Case.water, Case.water],
                                           [Case.water, Case.water, Case.water]])
        
        // Then
        
        XCTAssertTrue(result)
    }
    
    public func test_givenHorizontal_andBoatInTopLeftOfBoard_andSizeEqualToBoard_whenCanBePlaceIn_thenReturnTrue() {
        
        // When
        
        let result = sut.canBePlaceIn(position: Position(x: 0, y: 0),
                                      size: 3,
                                      orientation: .horizontal,
                                      in: [[Case.water, Case.water, Case.water],
                                           [Case.water, Case.water, Case.water],
                                           [Case.water, Case.water, Case.water]])
        
        // Then
        
        XCTAssertTrue(result)
    }

    public func test_givenHorizontal_andBoatInBottomRightOfBoard_whenCanBePlaceIn_thenReturnTrue() {
        
        // When
        
        let result = sut.canBePlaceIn(position: Position(x: 2, y: 2),
                                      size: 1,
                                      orientation: .horizontal,
                                      in: [[Case.water, Case.water, Case.water],
                                           [Case.water, Case.water, Case.water],
                                           [Case.water, Case.water, Case.water]])
        
        // Then
        
        XCTAssertTrue(result)
    }

    // MARK: - Vertical
    
    public func test_givenVertical_andBoatInMiddleOfBoard_whenCanBePlaceIn_thenReturnTrue() {
        
        // When
        
        let result = sut.canBePlaceIn(position: Position(x: 1, y: 1),
                                      size: 1,
                                      orientation: .vertical,
                                      in: [[Case.water, Case.water, Case.water],
                                           [Case.water, Case.water, Case.water],
                                           [Case.water, Case.water, Case.water]])
        
        // Then
        
        XCTAssertTrue(result)
    }
    
    public func test_givenVertical_andBoatInLeftOfBoard_whenCanBePlaceIn_thenReturnTrue() {
        
        // When
        
        let result = sut.canBePlaceIn(position: Position(x: 1, y: 0),
                                      size: 1,
                                      orientation: .vertical,
                                      in: [[Case.water, Case.water, Case.water],
                                           [Case.water, Case.water, Case.water],
                                           [Case.water, Case.water, Case.water]])
        
        // Then
        
        XCTAssertTrue(result)
    }
    
    public func test_givenVertical_andBoatInRightOfBoard_whenCanBePlaceIn_thenReturnTrue() {
        
        // When
        
        let result = sut.canBePlaceIn(position: Position(x: 1, y: 2),
                                      size: 1,
                                      orientation: .vertical,
                                      in: [[Case.water, Case.water, Case.water],
                                           [Case.water, Case.water, Case.water],
                                           [Case.water, Case.water, Case.water]])
        
        // Then
        
        XCTAssertTrue(result)
    }
    
    public func test_givenVertical_andBoatInTopOfBoard_whenCanBePlaceIn_thenReturnTrue() {
        
        // When
        
        let result = sut.canBePlaceIn(position: Position(x: 0, y: 1),
                                      size: 1,
                                      orientation: .vertical,
                                      in: [[Case.water, Case.water, Case.water],
                                           [Case.water, Case.water, Case.water],
                                           [Case.water, Case.water, Case.water]])
        
        // Then
        
        XCTAssertTrue(result)
    }

    public func test_givenVertical_andBoatInBottomOfBoard_whenCanBePlaceIn_thenReturnTrue() {
        
        // When
        
        let result = sut.canBePlaceIn(position: Position(x: 2, y: 1),
                                      size: 1,
                                      orientation: .vertical,
                                      in: [[Case.water, Case.water, Case.water],
                                           [Case.water, Case.water, Case.water],
                                           [Case.water, Case.water, Case.water]])
        
        // Then
        
        XCTAssertTrue(result)
    }

    public func test_givenVertical_andBoatInTopOfBoard_andSizeEqualToBoard_whenCanBePlaceIn_thenReturnTrue() {
        
        // When
        
        let result = sut.canBePlaceIn(position: Position(x: 0, y: 1),
                                      size: 3,
                                      orientation: .vertical,
                                      in: [[Case.water, Case.water, Case.water],
                                           [Case.water, Case.water, Case.water],
                                           [Case.water, Case.water, Case.water]])
        
        // Then
        
        XCTAssertTrue(result)
    }
    
    public func test_givenVertical_andBoatInTopLeftOfBoard_andSizeEqualToBoard_whenCanBePlaceIn_thenReturnTrue() {
        
        // When
        
        let result = sut.canBePlaceIn(position: Position(x: 0, y: 0),
                                      size: 3,
                                      orientation: .vertical,
                                      in: [[Case.water, Case.water, Case.water],
                                           [Case.water, Case.water, Case.water],
                                           [Case.water, Case.water, Case.water]])
        
        // Then
        
        XCTAssertTrue(result)
    }
    
    public func test_givenVertical_andBoatInTopOfBoard_andSizeEqualToBoard_andBoardIsNotAsOnlyOneColumn_whenCanBePlaceIn_thenReturnTrue() {
        
        // When
        
        let result = sut.canBePlaceIn(position: Position(x: 0, y: 0),
                                      size: 3,
                                      orientation: .vertical,
                                      in: [[Case.water],
                                           [Case.water],
                                           [Case.water]])
        
        // Then
        
        XCTAssertTrue(result)
    }

    public func test_givenHorizontal_andBoatInMiddleOfBoard_andSizeEqualToBoard_andBoardIsNotAsOnlyOneColumn_whenCanBePlaceIn_thenReturnTrue() {
        
        // When
        
        let result = sut.canBePlaceIn(position: Position(x: 0, y: 0),
                                      size: 3,
                                      orientation: .horizontal,
                                      in: [[Case.water, Case.water, Case.water]])
        
        // Then
        
        XCTAssertTrue(result)
    }
    
    // MARK: - With Croiseur
    
    func test_givenACroiseurOnTop_whenCanBePlaceInTop_thenReturnFalse() {
        // When
        
        let result = sut.canBePlaceIn(position: Position(x: 0, y: 0),
                                      size: 3,
                                      orientation: .horizontal,
                                      in: [[Case.croiseur, Case.croiseur, Case.croiseur],
                                           [Case.water, Case.water, Case.water],
                                           [Case.water, Case.water, Case.water]])
        
        // Then
        
        XCTAssertFalse(result)
    }
    
    func test_givenACroiseurOnTop_whenCanBePlaceInMiddle_thenReturnFalse() {
        // When
        
        let result = sut.canBePlaceIn(position: Position(x: 1, y: 0),
                                      size: 3,
                                      orientation: .horizontal,
                                      in: [[Case.croiseur, Case.croiseur, Case.croiseur],
                                           [Case.water, Case.water, Case.water],
                                           [Case.water, Case.water, Case.water]])
        
        // Then
        
        XCTAssertFalse(result)
    }
    
    func test_givenACroiseurOnTop_whenCanBePlaceInBottom_thenReturnTrue() {
        // When
        
        let result = sut.canBePlaceIn(position: Position(x: 2, y: 0),
                                      size: 3,
                                      orientation: .horizontal,
                                      in: [[Case.croiseur, Case.croiseur, Case.croiseur],
                                           [Case.water, Case.water, Case.water],
                                           [Case.water, Case.water, Case.water]])
        
        // Then
        
        XCTAssertTrue(result)
    }
    
    func test_givenACroiseurOnLeft_whenCanBePlaceInLeft_thenReturnFalse() {
        // When
        
        let result = sut.canBePlaceIn(position: Position(x: 0, y: 0),
                                      size: 3,
                                      orientation: .vertical,
                                      in: [[Case.croiseur, Case.water, Case.water],
                                           [Case.croiseur, Case.water, Case.water],
                                           [Case.croiseur, Case.water, Case.water]])
        
        // Then
        
        XCTAssertFalse(result)
    }
    
    func test_givenACroiseurOnLeft_whenCanBePlaceInMiddle_thenReturnFalse() {
        // When
        
        let result = sut.canBePlaceIn(position: Position(x: 0, y: 1),
                                      size: 3,
                                      orientation: .vertical,
                                      in: [[Case.croiseur, Case.water, Case.water],
                                           [Case.croiseur, Case.water, Case.water],
                                           [Case.croiseur, Case.water, Case.water]])
        
        // Then
        
        XCTAssertFalse(result)
    }
    
    func test_givenACroiseurOnLeft_whenCanBePlaceInRight_thenReturnTrue() {
        // When
        
        let result = sut.canBePlaceIn(position: Position(x: 0, y: 2),
                                      size: 3,
                                      orientation: .vertical,
                                      in: [[Case.croiseur, Case.water, Case.water],
                                           [Case.croiseur, Case.water, Case.water],
                                           [Case.croiseur, Case.water, Case.water]])
        
        // Then
        
        XCTAssertTrue(result)
    }
    
    // MARK: - With escorteur
    
    func test_givenAnEscorteurOnTop_whenCanBePlaceInTop_thenReturnFalse() {
        // When
        
        let result = sut.canBePlaceIn(position: Position(x: 0, y: 0),
                                      size: 3,
                                      orientation: .horizontal,
                                      in: [[Case.escorteur, Case.escorteur, Case.escorteur],
                                           [Case.water, Case.water, Case.water],
                                           [Case.water, Case.water, Case.water]])
        
        // Then
        
        XCTAssertFalse(result)
    }
    
    func test_givenAnEscorteurOnTop_whenCanBePlaceInMiddle_thenReturnFalse() {
        // When
        
        let result = sut.canBePlaceIn(position: Position(x: 0, y: 1),
                                      size: 3,
                                      orientation: .horizontal,
                                      in: [[Case.escorteur, Case.escorteur, Case.escorteur],
                                           [Case.water, Case.water, Case.water],
                                           [Case.water, Case.water, Case.water]])
        
        // Then
        
        XCTAssertFalse(result)
    }
    
    func test_givenAnEscorteurOnTop_whenCanBePlaceInBottom_thenReturnTrue() {
        // When
        
        let result = sut.canBePlaceIn(position: Position(x: 2, y: 0),
                                      size: 3,
                                      orientation: .horizontal,
                                      in: [[Case.escorteur, Case.escorteur, Case.escorteur],
                                           [Case.water, Case.water, Case.water],
                                           [Case.water, Case.water, Case.water]])
        
        // Then
        
        XCTAssertTrue(result)
    }
    
    func test_givenAnEscorteurOnLeft_whenCanBePlaceInLeft_thenReturnFalse() {
           // When
           
           let result = sut.canBePlaceIn(position: Position(x: 0, y: 0),
                                         size: 3,
                                         orientation: .vertical,
                                         in: [[Case.escorteur, Case.water, Case.water],
                                              [Case.escorteur, Case.water, Case.water],
                                              [Case.escorteur, Case.water, Case.water]])
           
           // Then
           
           XCTAssertFalse(result)
       }
       
       func test_givenAnEscorteurOnLeft_whenCanBePlaceInMiddle_thenReturnFalse() {
           // When
           
           let result = sut.canBePlaceIn(position: Position(x: 0, y: 1),
                                         size: 3,
                                         orientation: .vertical,
                                         in: [[Case.escorteur, Case.water, Case.water],
                                              [Case.escorteur, Case.water, Case.water],
                                              [Case.escorteur, Case.water, Case.water]])
           
           // Then
           
           XCTAssertFalse(result)
       }
       
       func test_givenAnEscorteurOnLeft_whenCanBePlaceInRight_thenReturnTrue() {
           // When
           
           let result = sut.canBePlaceIn(position: Position(x: 0, y: 2),
                                         size: 3,
                                         orientation: .vertical,
                                         in: [[Case.escorteur, Case.water, Case.water],
                                              [Case.escorteur, Case.water, Case.water],
                                              [Case.escorteur, Case.water, Case.water]])
           
           // Then
           
           XCTAssertTrue(result)
       }
    
    // MARK: - With torpilleur
    
    func test_givenATorpilleurOnTop_whenCanBePlaceInTop_thenReturnFalse() {
        // When
        
        let result = sut.canBePlaceIn(position: Position(x: 0, y: 0),
                                      size: 3,
                                      orientation: .horizontal,
                                      in: [[Case.torpilleur, Case.torpilleur, Case.torpilleur],
                                           [Case.water, Case.water, Case.water],
                                           [Case.water, Case.water, Case.water]])
        
        // Then
        
        XCTAssertFalse(result)
    }
    
    func test_givenATorpilleurOnTop_whenCanBePlaceInMiddle_thenReturnFalse() {
        // When
        
        let result = sut.canBePlaceIn(position: Position(x: 0, y: 1),
                                      size: 3,
                                      orientation: .horizontal,
                                      in: [[Case.torpilleur, Case.torpilleur, Case.torpilleur],
                                           [Case.water, Case.water, Case.water],
                                           [Case.water, Case.water, Case.water]])
        
        // Then
        
        XCTAssertFalse(result)
    }
    
    func test_givenATorpilleurOnTop_whenCanBePlaceInBottom_thenReturnTrue() {
        // When
        
        let result = sut.canBePlaceIn(position: Position(x: 2, y: 0),
                                      size: 3,
                                      orientation: .horizontal,
                                      in: [[Case.torpilleur, Case.torpilleur, Case.torpilleur],
                                           [Case.water, Case.water, Case.water],
                                           [Case.water, Case.water, Case.water]])
        
        // Then
        
        XCTAssertTrue(result)
    }
    
    func test_givenATorpilleurOnLeft_whenCanBePlaceInTop_thenReturnFalse() {
        // When
        
        let result = sut.canBePlaceIn(position: Position(x: 0, y: 0),
                                      size: 3,
                                      orientation: .vertical,
                                      in: [[Case.torpilleur, Case.water, Case.water],
                                           [Case.torpilleur, Case.water, Case.water],
                                           [Case.torpilleur, Case.water, Case.water]])
        
        // Then
        
        XCTAssertFalse(result)
    }
    
    func test_givenATorpilleurOnLeft_whenCanBePlaceInMiddle_thenReturnFalse() {
        // When
        
        let result = sut.canBePlaceIn(position: Position(x: 0, y: 1),
                                      size: 3,
                                      orientation: .vertical,
                                      in: [[Case.torpilleur, Case.water, Case.water],
                                           [Case.torpilleur, Case.water, Case.water],
                                           [Case.torpilleur, Case.water, Case.water]])
        
        // Then
        
        XCTAssertFalse(result)
    }
    
    func test_givenATorpilleurOnLeft_whenCanBePlaceInRight_thenReturnTrue() {
        // When
        
        let result = sut.canBePlaceIn(position: Position(x: 0, y: 2),
                                      size: 3,
                                      orientation: .vertical,
                                      in: [[Case.torpilleur, Case.water, Case.water],
                                           [Case.torpilleur, Case.water, Case.water],
                                           [Case.torpilleur, Case.water, Case.water]])
        
        // Then
        
        XCTAssertTrue(result)
    }

    // MARK: - With sousmarin
    
    func test_givenASousMarinOnTop_whenCanBePlaceInTop_thenReturnFalse() {
        // When
        
        let result = sut.canBePlaceIn(position: Position(x: 0, y: 0),
                                      size: 3,
                                      orientation: .horizontal,
                                      in: [[Case.sousmarin, Case.sousmarin, Case.sousmarin],
                                           [Case.water, Case.water, Case.water],
                                           [Case.water, Case.water, Case.water]])
        
        // Then
        
        XCTAssertFalse(result)
    }
    
    func test_givenASousMarinOnTop_whenCanBePlaceInMiddle_thenReturnFalse() {
        // When
        
        let result = sut.canBePlaceIn(position: Position(x: 1, y: 0),
                                      size: 3,
                                      orientation: .horizontal,
                                      in: [[Case.sousmarin, Case.sousmarin, Case.sousmarin],
                                           [Case.water, Case.water, Case.water],
                                           [Case.water, Case.water, Case.water]])
        
        // Then
        
        XCTAssertFalse(result)
    }
    
    func test_givenASousMarinOnTop_whenCanBePlaceInBottom_thenReturnTrue() {
        // When
        
        let result = sut.canBePlaceIn(position: Position(x: 2, y: 0),
                                      size: 3,
                                      orientation: .horizontal,
                                      in: [[Case.sousmarin, Case.sousmarin, Case.sousmarin],
                                           [Case.water, Case.water, Case.water],
                                           [Case.water, Case.water, Case.water]])
        
        // Then
        
        XCTAssertTrue(result)
    }
    
    func test_givenASousMarinOnLeft_whenCanBePlaceInLeft_thenReturnFalse() {
        // When
        
        let result = sut.canBePlaceIn(position: Position(x: 0, y: 0),
                                      size: 3,
                                      orientation: .vertical,
                                      in: [[Case.sousmarin, Case.water, Case.water],
                                           [Case.sousmarin, Case.water, Case.water],
                                           [Case.sousmarin, Case.water, Case.water]])
        
        // Then
        
        XCTAssertFalse(result)
    }
    
    func test_givenASousMarinOnLeft_whenCanBePlaceInMiddle_thenReturnFalse() {
        // When
        
        let result = sut.canBePlaceIn(position: Position(x: 0, y: 1),
                                      size: 3,
                                      orientation: .vertical,
                                      in: [[Case.sousmarin, Case.water, Case.water],
                                           [Case.sousmarin, Case.water, Case.water],
                                           [Case.sousmarin, Case.water, Case.water]])
        
        // Then
        
        XCTAssertFalse(result)
    }
    
    func test_givenASousMarinOnLeft_whenCanBePlaceInRight_thenReturnTrue() {
        // When
        
        let result = sut.canBePlaceIn(position: Position(x: 0, y: 2),
                                      size: 3,
                                      orientation: .vertical,
                                      in: [[Case.sousmarin, Case.water, Case.water],
                                           [Case.sousmarin, Case.water, Case.water],
                                           [Case.sousmarin, Case.water, Case.water]])
        
        // Then
        
        XCTAssertTrue(result)
    }
}
