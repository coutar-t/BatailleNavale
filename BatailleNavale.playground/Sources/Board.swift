import Foundation

class Board {
    var boats: [Boat]
    var cases: [[Case]] = []
    
    private enum Constants {
        static let maxPlacementTry = 30
    }
    
    private func initBoard(boardSize: Int) {
        for x in 0..<boardSize {
            cases.append([])
            for _ in 0..<boardSize {
                cases[x].append(.water)
            }
        }
    }
    
    private func isTopNotAvailable(x: Int, possibleY: Int) -> Bool {
        return x > 0 && cases[x - 1][possibleY] != Case.water
    }
    
    private func isbottomNotAvailable(x: Int, possibleY: Int) -> Bool {
        return x + 1 < cases.count && cases[x + 1][possibleY] != Case.water
    }
    
    private func isLeftNotAvailable(possibleX: Int, y: Int) -> Bool {
        return y > 0 && cases[possibleX][y - 1] != Case.water
    }
    
    private func isRightNotAvailable(possibleX: Int, y: Int) -> Bool {
        return y + 1 < cases[possibleX].count && cases[possibleX][y + 1] != Case.water
    }
        
    private func canBePlaceIn(x: Int, y: Int, size: Int, position: Orientation) -> Bool {
        switch position {
        case .horizontal:
            guard y + size < cases[x].count - 1 else { return false }
            for possibleY in y..<y + size {
                if isTopNotAvailable(x: x, possibleY: possibleY) ||
                    isbottomNotAvailable(x: x, possibleY: possibleY) ||
                    cases[x][possibleY] != Case.water
                {
                    return false
                }
            }
            if isRightNotAvailable(possibleX: x, y: y + size - 1) ||
                isLeftNotAvailable(possibleX: x, y: y) {
                return false
            }
        case .vertical:
            guard x + size < cases.count - 1 else { return false }
            for possibleX in x..<x + size {
                if isRightNotAvailable(possibleX: possibleX, y: y) ||
                    isLeftNotAvailable(possibleX: possibleX, y: y) ||
                                       cases[possibleX][y] != Case.water {
                    return false
                }
            }
            if isTopNotAvailable(x: x, possibleY: y) ||
                isbottomNotAvailable(x: x + size - 1, possibleY: y) {
                return false
            }
        }
        return true
    }
    
    private func generateXYPosition() -> (Int, Int, Orientation) {
        let x = Int.random(in: 0..<cases.count)
        let y = Int.random(in: 0..<cases[x].count)
        let position = Orientation(rawValue: Int.random(in: 0...1)) ?? .horizontal
        return (x, y, position)
    }
    
    private func place(boat: Boat) throws {
        for _ in 0..<Constants.maxPlacementTry {
            let (x, y, position) = generateXYPosition()
            if canBePlaceIn(x: x, y: y, size: boat.size, position: position) {
                if position == .vertical {
                    for xIterator in x..<x + boat.size {
                        cases[xIterator][y] = Case.fromBoat(boat)
                    }
                } else {
                    for yIterator in y..<y + boat.size {
                        cases[x][yIterator] = Case.fromBoat(boat)
                    }
                }
                return
            }
        }
        throw PlacementError.noMoreSpace
    }
    
    private func placeBoats() {
        for boat in boats {
            do {
                try place(boat: boat)
            } catch let error {
                print("Cannot place \(boat)")
                print(error.localizedDescription)
                return
            }
        }
    }
    
    init(boats: [Boat], boardSize: Int) {
        self.boats = boats
        initBoard(boardSize: boardSize)
        placeBoats()
    }
    
    func display() {
        for x in cases {
            print(x.reduce("", { $0 + $1.print }))
        }
    }
}
