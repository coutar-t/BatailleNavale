import Foundation

enum PlacementError: Error {
    case noMoreSpace
}

extension PlacementError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .noMoreSpace: return "No more space available in the board."
        }
    }
}
