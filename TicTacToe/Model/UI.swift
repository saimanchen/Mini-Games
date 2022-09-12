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
            return name2
        } else if isPlayerTurn[1] {
            return name1
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
    
    func onReset(UIButtons: Array<UIButton>) {
        for button in UIButtons {
            button.setImage(UIImage(named: "blank.png"), for: .normal)
        }
    }
}
