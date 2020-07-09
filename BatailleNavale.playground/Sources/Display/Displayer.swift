import Foundation

protocol Displayer {
    func displayPlacementError(error: Error, for boat: Boat)
    func displayBoard(board: [[Case]])
}

class TerminalDisplayer: Displayer {
    func displayPlacementError(error: Error, for boat: Boat) {
        print("Cannot place \(boat)")
        print(error.localizedDescription)
    }
    
    func displayBoard(board: [[Case]]) {
        for x in board {
            print(x.reduce("", { $0 + $1.print }))
        }
    }
}
