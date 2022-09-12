import Foundation

struct Player {
    var name: String
    var isTurn: Bool
    var isWinner: Bool
    var score: Int
    
    init(name: String, isTurn: Bool, isWinner: Bool, score: Int) {
        self.name = name
        self.isTurn = isTurn
        self.isWinner = isWinner
        self.score = score
    }
}
