import Foundation

struct Player {
    var name: String
    var isTurn: Bool
    
    init(name: String, isTurn: Bool) {
        self.name = name
        self.isTurn = isTurn
    }
}
