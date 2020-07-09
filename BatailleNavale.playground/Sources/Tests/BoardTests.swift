import Foundation
import XCTest

public class BoardTests: XCTestCase {
    
    public func test_givenZeroBoardSize_whenInit_thenNothingHappens() {
        // Given
        let displayerMock = DisplayerMock()
        let rulesMock = RulesMock()
        rulesMock.canBePlaceInReturnValue = true
        let board = Board(boats: [], boardSize: 0, displayer: displayerMock, rules: rulesMock)
        
        
        // Then
        XCTAssertFalse(displayerMock.displayBoardCalled)
        XCTAssertFalse(displayerMock.displayPlacementErrorCalled)
        XCTAssertFalse(rulesMock.canBePlaceInCalled)
    }
    
    public func test_whenDisplay_thenDisplayerIsCalled() {
        // Given
        let displayerMock = DisplayerMock()
        let rulesMock = RulesMock()
        rulesMock.canBePlaceInReturnValue = true
        let board = Board(boats: [], boardSize: 1, displayer: displayerMock, rules: rulesMock)
        
        // When
        board.display()
        
        // Then
        XCTAssertTrue(displayerMock.displayBoardCalledOnly)
        XCTAssertEqual(displayerMock.displayBoardCallsCount, 1)
        XCTAssertEqual(displayerMock.receivedDisplayBoardArguments, [[Case.water]])
    }
    
    public func test_givenOneSubmarine_andRulesSaysTrue_whenInit_thenPlaceSubmarine() {
        // Given
        let displayerMock = DisplayerMock()
        let rulesMock = RulesMock()
        rulesMock.canBePlaceInReturnValue = true
        _ = Board(boats: [.sousmarin], boardSize: 1, displayer: displayerMock, rules: rulesMock)
        
        
        // Then
        XCTAssertEqual(rulesMock.canBePlaceInCallsCount, 1)
        XCTAssertEqual(rulesMock.canBePlaceInReceivedArguments?.position.x, 0)
        XCTAssertEqual(rulesMock.canBePlaceInReceivedArguments?.position.y, 0)
        XCTAssertEqual(rulesMock.canBePlaceInReceivedArguments?.board, [[Case.water]])
        XCTAssertEqual(rulesMock.canBePlaceInReceivedArguments?.size, 1)
    }
    
    public func test_givenOneSubmarine_andRulesSaysFalse_whenInit_thenDisplayError() {
        // Given
        let displayerMock = DisplayerMock()
        let rulesMock = RulesMock()
        rulesMock.canBePlaceInReturnValue = false
        _ = Board(boats: [.croiseur], boardSize: 1, displayer: displayerMock, rules: rulesMock)
        
        
        // Then
        XCTAssertEqual(rulesMock.canBePlaceInCallsCount, 30)
        XCTAssertEqual(rulesMock.canBePlaceInReceivedArguments?.position.x, 0)
        XCTAssertEqual(rulesMock.canBePlaceInReceivedArguments?.position.y, 0)
        XCTAssertEqual(rulesMock.canBePlaceInReceivedArguments?.board, [[Case.water]])
        XCTAssertEqual(rulesMock.canBePlaceInReceivedArguments?.size, 4)
        
        XCTAssertEqual(displayerMock.receivedDisplayPlacementErrorArguments?.error as? PlacementError, PlacementError.noMoreSpace)
        XCTAssertEqual(displayerMock.receivedDisplayPlacementErrorArguments?.boat, Boat.croiseur)
        XCTAssertTrue(displayerMock.displayPlacementErrorCalledOnly)
        XCTAssertEqual(displayerMock.displayPlacementErrorCallsCount, 1)
    }
}

class DisplayerMock: Displayer {
    var receivedDisplayPlacementErrorArguments: (error: Error, boat: Boat)?
    var displayPlacementErrorCallsCount: Int = 0
    var displayPlacementErrorCalled: Bool { return displayPlacementErrorCallsCount > 0 }
    var displayPlacementErrorCalledOnly: Bool {
        return displayPlacementErrorCalled && !displayBoardCalled
    }
    
    func displayPlacementError(error: Error, for boat: Boat) {
        displayPlacementErrorCallsCount += 1
        receivedDisplayPlacementErrorArguments = (error: error, boat: boat)
    }
    
    var receivedDisplayBoardArguments: [[Case]]?
    var displayBoardCallsCount: Int = 0
    var displayBoardCalled: Bool { return displayBoardCallsCount > 0 }
    var displayBoardCalledOnly: Bool {
        return displayBoardCalled && !displayPlacementErrorCalled
    }
    
    func displayBoard(board: [[Case]]) {
        displayBoardCallsCount += 1
        receivedDisplayBoardArguments = board
    }
}

class RulesMock: Rules {
    var canBePlaceInReturnValue: Bool!
    var canBePlaceInReceivedArguments: (position: Position,
    size: Int,
    orientation: Orientation,
    board: [[Case]])?
    var canBePlaceInCallsCount: Int = 0
    var canBePlaceInCalled: Bool { return canBePlaceInCallsCount > 0 }
    
    func canBePlaceIn(position: Position,
    size: Int,
    orientation: Orientation,
    in board: [[Case]]) -> Bool {
        canBePlaceInReceivedArguments = (position: position,
        size: size,
        orientation: orientation,
        board: board)
        canBePlaceInCallsCount += 1
        return canBePlaceInReturnValue
    }
}
