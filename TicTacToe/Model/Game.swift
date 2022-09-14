import Foundation
import UIKit

class Game {
    var computer: Player
    
    var player1: Player
    var player2: Player
    
    init(player1: Player, player2: Player, computer: Player) {
        self.player1 = player1
        self.player2 = player2
        self.computer = computer
    }
    
    var isGameStarted = false
    var hasWon: Bool = false
    var isDraw = false
    
    var isTapped: Array<Bool> = [false, false, false, false, false, false, false, false, false]
    
    var isPlayerTurn: Array<Bool> = [true, false]
    
    var player1Array: Array<Int> = []
    var player2Array: Array<Int> = []
    
    var winConditions: Array<Array<Int>> = [
        [0, 1, 2],
        [3, 4, 5],
        [6, 7, 8],
        [0, 3, 6],
        [1, 4, 7],
        [2, 5, 8],
        [0, 4, 8],
        [2, 4, 6]
    ]
    
    // COMPUTER
    func computerTurn() -> Int {
        if hasWon { return -1 }
        
        let randomInt = getRandomInt()
        if isTapped[randomInt] == false {
            return randomInt
        }
        return computerTurn()
    }
    
    func getRandomInt() -> Int {
        let randomInt = Int.random(in: 0..<9)
        return randomInt
    }

    // GAME LOGIC METHODS
    func toggleTurn(isPlayerTurn: Array<Bool>) -> Array<Bool> {
        var isPlayerTurn = isPlayerTurn
        
        if isPlayerTurn[0] {
            isPlayerTurn = [false, true]
        } else if isPlayerTurn[1] {
            isPlayerTurn = [true, false]
        }
        return isPlayerTurn
    }
    
    func appendToPlayerArray(isPlayerTurn: Array<Bool>, index: Int) {
        if isPlayerTurn[0] {
            player1Array.append(index)
        } else {
            player2Array.append(index)
        }
        print(player1Array)
        print(player2Array)
    }
    
    func checkIfWon(playerArray: Array<Int>) -> Bool{
        if playerArray.count < 3 {
            return false
        } else {
            for winCondition in winConditions {
                if winCondition.allSatisfy(playerArray.contains) {
                    return true
                }
            }
        }
        return false
    }
    
    func checkDraw() -> Bool {
        var count = 0
        for tapped in isTapped {
            if tapped == true {
                count += 1
            }
        }
        if count == 9 && !hasWon {
            return true
        }
        return false
    }
    
    func onReset() {
        isTapped = [false, false, false, false, false, false, false, false, false]
        player1Array = []
        player2Array = []
        hasWon = false
        //isGameStarted = false
        print(isTapped)
    }
    
    func updateScore() {
        if isPlayerTurn[0] {
            player2.score += 1
            computer.score += 1
        } else {
            player1.score += 1
        }
    }
    
    
    // UI METHODS
    func getImage(isPlayerTurn: Array<Bool>) -> UIImage {
        if isPlayerTurn[0] {
            return UIImage(named: "circle.png") ?? UIImage(named: "blank.png")!
        } else if isPlayerTurn[1] {
            return UIImage(named: "square.png") ?? UIImage(named: "blank.png")!
        }
        return UIImage(named: "blank.png") ?? UIImage(named: "blank.png")!
    }
    
    func getPlayerName(isPlayerTurn: Array<Bool>, name1: String, name2: String) -> String {
        if isPlayerTurn[0] {
            return name1
        } else if isPlayerTurn[1] {
            return name2
        }
        return "Error"
    }
    
    func disableAllButtons(UIButtons: Array<UIButton>) {
        for button in UIButtons {
            button.isUserInteractionEnabled = false
        }
    }
    
    func enableAllButtons(UIButtons: Array<UIButton>) {
        for button in UIButtons {
            button.isUserInteractionEnabled = true
        }
    }
    
    func blankAllButtons(UIButtons: Array<UIButton>) {
        for button in UIButtons {
            button.setImage(UIImage(named: "blank.png"), for: .normal)
        }
    }
    
    func getWinnerName() -> Int {
        if isPlayerTurn[0] {
            return 1
        } else if isPlayerTurn[1] {
            return 0
        }
        return 404
    }
}
