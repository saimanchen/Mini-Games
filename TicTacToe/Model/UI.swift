//
//  File.swift
//  MiniGames
//
//  Created by Saiman Chen on 2022-09-07.
//

import Foundation
import UIKit


class UI {
    
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
}
