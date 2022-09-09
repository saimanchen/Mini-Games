//
//  Logic.swift
//  TicTacToe
//
//  Created by Saiman Chen on 2022-09-07.
//

import Foundation
import UIKit

class Logic {
    
    var isTapped: Array<Bool> = [false, false, false, false, false, false, false, false, false]
    var player1Array: Array<Int>?
    var player2Array: Array<Int>?
    
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
}
