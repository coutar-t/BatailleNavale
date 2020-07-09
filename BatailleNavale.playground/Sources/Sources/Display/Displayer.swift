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
            print(x.reduce("", { current, boardCase in
                switch boardCase {
                    case .croiseur: return current + "c"
                    case .escorteur: return current + "e"
                    case .sousmarin: return current + "s"
                    case .torpilleur: return current + "t"
                    case .water: return current + "-"
                }
            }))
        }
    }
}
