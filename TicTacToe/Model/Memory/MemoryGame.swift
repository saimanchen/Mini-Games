import Foundation

class MemoryGame {
    var player1: Player
    var player2: Player
    
    
    init(player1: Player, player2: Player) {
        self.player1 = player1
        self.player2 = player2
    }
    
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
    
}
