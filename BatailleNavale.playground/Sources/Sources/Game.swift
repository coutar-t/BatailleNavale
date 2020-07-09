import Foundation

public class Game {
    static let croiseurNb = 1
    static let escorteurNb = 2
    static let torpilleurNb = 3
    static let sousmarinNb = 4

    var board: Board
    
    public init(gameSize: Int) {
        var boats: [Boat] = []
        
        for _ in 0..<Game.croiseurNb {
            boats.append(.croiseur)
        }
        for _ in 0..<Game.escorteurNb {
            boats.append(.escorteur)
        }
        for _ in 0..<Game.torpilleurNb {
            boats.append(.torpilleur)
        }
        for _ in 0..<Game.sousmarinNb {
            boats.append(.sousmarin)
        }
        board = Board(boats: boats,
                      boardSize: gameSize,
                      displayer: TerminalDisplayer(),
                      rules: PlacementRules())
    }
    
    public func display() {
        board.display()
    }
}
