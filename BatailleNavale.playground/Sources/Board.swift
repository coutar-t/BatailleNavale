import Foundation

class Board {
    var boats: [Boat]
    var cases: [[Case]] = []
    let displayer: Displayer
    let rules: Rules
    
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
    
    private func generateXYPosition() -> (Int, Int, Orientation) {
        let x = Int.random(in: 0..<cases.count)
        let y = Int.random(in: 0..<cases[x].count)
        let position = Orientation(rawValue: Int.random(in: 0...1)) ?? .horizontal
        return (x, y, position)
    }
    
    private func place(boat: Boat) throws {
        for _ in 0..<Constants.maxPlacementTry {
            let (x, y, orientation) = generateXYPosition()
            if rules.canBePlaceIn(position: Position(x: x, y: y),
                                  size: boat.size,
                                  orientation: orientation,
                                  in: cases) {
                if orientation == .vertical {
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
                displayer.displayPlacementError(error: error, for: boat)
                return
            }
        }
    }
    
    init(boats: [Boat],
         boardSize: Int,
         displayer: Displayer,
         rules: Rules) {
        self.displayer = displayer
        self.boats = boats
        self.rules = rules
        initBoard(boardSize: boardSize)
        placeBoats()
    }
    
    func display() {
        displayer.displayBoard(board: cases)
    }
}
