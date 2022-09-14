import Foundation

class Player {
    var name: String
    var isTurn: Bool
    var score: Int
    
    init(name: String, isTurn: Bool, score: Int) {
        self.name = name
        self.isTurn = isTurn
        self.score = score
    }
}
