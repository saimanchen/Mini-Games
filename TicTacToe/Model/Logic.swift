import Foundation
import UIKit

class Logic {
    
    var isGameStarted = false
    
    var hasWon: Bool = false
    
    var isTapped: Array<Bool> = [false, false, false, false, false, false, false, false, false]
    
    var isPlayerTurn: Array<Bool>?
    
    var player1Array: Array<Int> = []
    var player2Array: Array<Int> = []
    
    var winConditions: Array<Array<Int>> = [
        [0, 1, 2],
        [3, 4, 5],
        [6, 7, 9],
        [0, 3, 6],
        [1, 4, 7],
        [2, 5, 8],
        [0, 4, 8],
        [2, 4, 6]
    ]

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
    }
    
    func checkWinner(playerArray: Array<Int>) -> Bool{
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
    
    func checkDraw() {
        var count = 0
        for tapped in isTapped {
            if tapped == true {
                count += 1
            }
        }
        if count == 9 && !hasWon {
            print("Draw")
        }
    }
    
    func onReset() {
        isTapped = [false, false, false, false, false, false, false, false, false]
        player1Array = []
        player2Array = []
        hasWon = false
        isGameStarted = false
        print(isTapped)
    }
    
//    func updateScore(player1: Player, player2: Player) -> Int {
//
//    }
}
