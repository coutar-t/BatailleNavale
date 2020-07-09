import Foundation

enum Boat {
    case croiseur
    case escorteur
    case torpilleur
    case sousmarin
    
    var size: Int {
        switch self {
        case .croiseur: return 4
        case .escorteur: return 3
        case .torpilleur: return 2
        case .sousmarin: return 1
        }
    }
}
