import Foundation

struct Position {
    var x: Int
    var y: Int
}

protocol Rules {
    func canBePlaceIn(position: Position,
                      size: Int,
                      orientation: Orientation,
                      in board: [[Case]]) -> Bool
}

class PlacementRules: Rules {
    private func isTopNotAvailable(for position: Position, in board: [[Case]]) -> Bool {
        return position.x > 0 &&
            board[position.x - 1][position.y] != Case.water
    }
    
    private func isbottomNotAvailable(for position: Position, in board: [[Case]]) -> Bool {
        return position.x + 1 < board.count &&
            board[position.x + 1][position.y] != Case.water
    }
    
    private func isLeftNotAvailable(for position: Position, in board: [[Case]]) -> Bool {
        return position.y > 0 &&
            board[position.x][position.y - 1] != Case.water
    }
    
    private func isRightNotAvailable(for position: Position, in board: [[Case]]) -> Bool {
        return position.y + 1 < board[position.x].count &&
            board[position.x][position.y + 1] != Case.water
    }
        
    func canBePlaceIn(position: Position, size: Int, orientation: Orientation, in board: [[Case]]) -> Bool {
        switch orientation {
        case .horizontal:
            guard position.y + size <= board[position.x].count else { return false }
            for possibleY in position.y..<position.y + size {
                if isTopNotAvailable(for: Position(x: position.x, y: possibleY), in: board) ||
                    isbottomNotAvailable(for: Position(x: position.x, y: possibleY), in: board) ||
                    board[position.x][possibleY] != Case.water
                {
                    return false
                }
            }
            if isRightNotAvailable(for: Position(x: position.x, y: position.y + size - 1), in: board) ||
                isLeftNotAvailable(for: Position(x: position.x, y: position.y), in: board) {
                return false
            }
        case .vertical:
            guard position.x + size <= board.count else { return false }
            for possibleX in position.x..<position.x + size {
                if isRightNotAvailable(for: Position(x: possibleX, y: position.y), in: board) ||
                    isLeftNotAvailable(for: Position(x: possibleX, y: position.y), in: board) ||
                    board[possibleX][position.y] != Case.water {
                    return false
                }
            }
            if isTopNotAvailable(for: Position(x: position.x, y: position.y), in: board) ||
                isbottomNotAvailable(for: Position(x: position.x + size - 1, y: position.y), in: board) {
                return false
            }
        }
        return true
    }
}
