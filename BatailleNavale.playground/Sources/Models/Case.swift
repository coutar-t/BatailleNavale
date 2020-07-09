import Foundation

enum Case {
    case croiseur
    case escorteur
    case torpilleur
    case sousmarin
    case water
    
    static func fromBoat(_ boat: Boat) -> Case {
        switch boat {
        case .croiseur: return .croiseur
        case .escorteur: return .escorteur
        case .sousmarin: return .sousmarin
        case .torpilleur: return .torpilleur
        }
    }
    
    var print: String {
        switch self {
        case .croiseur: return "c"
        case .escorteur: return "e"
        case .sousmarin: return "s"
        case .torpilleur: return "t"
        case .water: return "-"
        }
    }
}
