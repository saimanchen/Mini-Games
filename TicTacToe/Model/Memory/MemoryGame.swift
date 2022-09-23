import Foundation

class MemoryGame {
    var player1: Player
    var player2: Player
    
    init(player1: Player, player2: Player) {
        self.player1 = player1
        self.player2 = player2
    }
    
    var player1Pairs: Int = 0
    var player2Pairs: Int = 0
    
    var isPlayerTurn: Array<Bool> = [true, false]
    var chosenCells: Array<String> = []
    var firstTag: Int?
    var turnCount: Int = 0
    var isGameStarted = false
    var isAMatch = false
    var hasWon: Bool = false
    var isDraw = false
    
    var cellArray: Array<String> = [
        "memory_flower_1",
        "memory_flower_1",
        "memory_flower_2",
        "memory_flower_2",
        "memory_flower_3",
        "memory_flower_3",
        "memory_flower_4",
        "memory_flower_4",
        "memory_flower_5",
        "memory_flower_5",
        "memory_flower_6",
        "memory_flower_6",
        "memory_flower_7",
        "memory_flower_7",
        "memory_flower_8",
        "memory_flower_8",
        "memory_flower_9",
        "memory_flower_9",
        "memory_flower_10",
        "memory_flower_10"
    ]
    
    func shuffleCells() -> Array<String> {
        for (index, _) in cellArray.enumerated() {
            let temp = cellArray[index]
            let random = Int.random(in: 0...19)

            cellArray[index] = cellArray[random]
            cellArray[random] = temp
        }
        
        return cellArray
    }
    
    func toggleTurn(isPlayerTurn: Array<Bool>) -> Array<Bool> {
        var isPlayerTurn = isPlayerTurn
        
        if isPlayerTurn[0] {
            isPlayerTurn = [false, true]
            turnCount = 0
        } else if isPlayerTurn[1] {
            isPlayerTurn = [true, false]
            turnCount = 0
        }
        return isPlayerTurn
    }
    
    func isAMatch(array: Array<String>) -> Bool {
        if array[0] == array[1] {
            return true
        }
        return false
    }
    
    func updatePlayerPairs(isPlayerTurn: Array<Bool>) {
        if isPlayerTurn[0] {
            player1Pairs += 1
        } else {
            player2Pairs += 1
        }
    }
}
