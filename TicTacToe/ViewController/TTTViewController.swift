import UIKit

class TTTViewController: UIViewController {
    
    var receivingPlayer1: Player?
    var receivingPlayer2: Player?
    
    var isPlayerTurn: Array<Bool>?
    
    var logic: Logic = Logic()
    var ui: UI = UI()
    
    var array1: Array<Int> = [0, 1, 2]
    
    @IBOutlet weak var lblName: UILabel!
    
    // Image buttons
    @IBOutlet var imgButtons: [UIButton]!
    @IBAction func onPress(_ sender: UIButton) {
        if let isPlayerTurn = isPlayerTurn,
           let receivingPlayer1 = receivingPlayer1,
           let receivingPlayer2 = receivingPlayer2 {
            
            let tag = sender.tag
            switch tag {
            case 0:
                imgButtons[0].setImage(ui.getImage(isPlayerTurn: isPlayerTurn), for: .normal)
                self.isPlayerTurn = logic.toggleTurn(isPlayerTurn: isPlayerTurn)
                lblName.text = ui.getPlayerName(isPlayerTurn: isPlayerTurn, name1: receivingPlayer1.name, name2: receivingPlayer2.name)
                logic.appendToPlayerArray(isPlayerTurn: isPlayerTurn, index: tag)
                if logic.isTapped[0] == false {
                    logic.isTapped[0] = true
                    imgButtons[0].isUserInteractionEnabled = false
                }
                if isPlayerTurn[0] {
                    logic.checkWinner(playerArray: logic.player1Array ?? [])
                } else {
                    logic.checkWinner(playerArray: logic.player2Array ?? [])
                }
                
            case 1:
                imgButtons[1].setImage(ui.getImage(isPlayerTurn: isPlayerTurn), for: .normal)
                self.isPlayerTurn = logic.toggleTurn(isPlayerTurn: isPlayerTurn)
                lblName.text = ui.getPlayerName(isPlayerTurn: isPlayerTurn, name1: receivingPlayer1.name, name2: receivingPlayer2.name)
                logic.appendToPlayerArray(isPlayerTurn: isPlayerTurn, index: tag)
                if logic.isTapped[1] == false {
                    logic.isTapped[1] = true
                    imgButtons[1].isUserInteractionEnabled = false
                }
                if isPlayerTurn[0] {
                    logic.checkWinner(playerArray: logic.player1Array ?? [])
                } else {
                    logic.checkWinner(playerArray: logic.player2Array ?? [])
                }
            case 2:
                imgButtons[2].setImage(ui.getImage(isPlayerTurn: isPlayerTurn), for: .normal)
                self.isPlayerTurn = logic.toggleTurn(isPlayerTurn: isPlayerTurn)
                lblName.text = ui.getPlayerName(isPlayerTurn: isPlayerTurn, name1: receivingPlayer1.name, name2: receivingPlayer2.name)
                logic.appendToPlayerArray(isPlayerTurn: isPlayerTurn, index: tag)
                if logic.isTapped[2] == false {
                    logic.isTapped[2] = true
                    imgButtons[2].isUserInteractionEnabled = false
                }
                if isPlayerTurn[0] {
                    logic.checkWinner(playerArray: logic.player1Array ?? [])
                } else {
                    logic.checkWinner(playerArray: logic.player2Array ?? [])
                }
            case 3:
                imgButtons[3].setImage(ui.getImage(isPlayerTurn: isPlayerTurn), for: .normal)
                self.isPlayerTurn = logic.toggleTurn(isPlayerTurn: isPlayerTurn)
                lblName.text = ui.getPlayerName(isPlayerTurn: isPlayerTurn, name1: receivingPlayer1.name, name2: receivingPlayer2.name)
                logic.appendToPlayerArray(isPlayerTurn: isPlayerTurn, index: tag)
                if logic.isTapped[3] == false {
                    logic.isTapped[3] = true
                    imgButtons[3].isUserInteractionEnabled = false
                }
                if isPlayerTurn[0] {
                    logic.checkWinner(playerArray: logic.player1Array ?? [])
                } else {
                    logic.checkWinner(playerArray: logic.player2Array ?? [])
                }
            case 4:
                imgButtons[4].setImage(ui.getImage(isPlayerTurn: isPlayerTurn), for: .normal)
                self.isPlayerTurn = logic.toggleTurn(isPlayerTurn: isPlayerTurn)
                lblName.text = ui.getPlayerName(isPlayerTurn: isPlayerTurn, name1: receivingPlayer1.name, name2: receivingPlayer2.name)
                logic.appendToPlayerArray(isPlayerTurn: isPlayerTurn, index: tag)
                if logic.isTapped[4] == false {
                    logic.isTapped[4] = true
                    imgButtons[4].isUserInteractionEnabled = false
                }
                if isPlayerTurn[0] {
                    logic.checkWinner(playerArray: logic.player1Array ?? [])
                } else {
                    logic.checkWinner(playerArray: logic.player2Array ?? [])
                }
            case 5:
                imgButtons[5].setImage(ui.getImage(isPlayerTurn: isPlayerTurn), for: .normal)
                self.isPlayerTurn = logic.toggleTurn(isPlayerTurn: isPlayerTurn)
                lblName.text = ui.getPlayerName(isPlayerTurn: isPlayerTurn, name1: receivingPlayer1.name, name2: receivingPlayer2.name)
                logic.appendToPlayerArray(isPlayerTurn: isPlayerTurn, index: tag)
                if logic.isTapped[5] == false {
                    logic.isTapped[5] = true
                    imgButtons[5].isUserInteractionEnabled = false
                }
                if isPlayerTurn[0] {
                    logic.checkWinner(playerArray: logic.player1Array ?? [])
                } else {
                    logic.checkWinner(playerArray: logic.player2Array ?? [])
                }
            case 6:
                imgButtons[6].setImage(ui.getImage(isPlayerTurn: isPlayerTurn), for: .normal)
                self.isPlayerTurn = logic.toggleTurn(isPlayerTurn: isPlayerTurn)
                lblName.text = ui.getPlayerName(isPlayerTurn: isPlayerTurn, name1: receivingPlayer1.name, name2: receivingPlayer2.name)
                logic.appendToPlayerArray(isPlayerTurn: isPlayerTurn, index: tag)
                if logic.isTapped[6] == false {
                    logic.isTapped[6] = true
                    imgButtons[6].isUserInteractionEnabled = false
                }
                if isPlayerTurn[0] {
                    logic.checkWinner(playerArray: logic.player1Array ?? [])
                } else {
                    logic.checkWinner(playerArray: logic.player2Array ?? [])
                }
            case 7:
                imgButtons[7].setImage(ui.getImage(isPlayerTurn: isPlayerTurn), for: .normal)
                self.isPlayerTurn = logic.toggleTurn(isPlayerTurn: isPlayerTurn)
                lblName.text = ui.getPlayerName(isPlayerTurn: isPlayerTurn, name1: receivingPlayer1.name, name2: receivingPlayer2.name)
                logic.appendToPlayerArray(isPlayerTurn: isPlayerTurn, index: tag)
                if logic.isTapped[7] == false {
                    logic.isTapped[7] = true
                    imgButtons[7].isUserInteractionEnabled = false
                }
                if isPlayerTurn[0] {
                    logic.checkWinner(playerArray: logic.player1Array ?? [])
                } else {
                    logic.checkWinner(playerArray: logic.player2Array ?? [])
                }
            case 8:
                imgButtons[8].setImage(ui.getImage(isPlayerTurn: isPlayerTurn), for: .normal)
                self.isPlayerTurn = logic.toggleTurn(isPlayerTurn: isPlayerTurn)
                lblName.text = ui.getPlayerName(isPlayerTurn: isPlayerTurn, name1: receivingPlayer1.name, name2: receivingPlayer2.name)
                logic.appendToPlayerArray(isPlayerTurn: isPlayerTurn, index: tag)
                if logic.isTapped[8] == false {
                    logic.isTapped[8] = true
                    imgButtons[8].isUserInteractionEnabled = false
                }
                if isPlayerTurn[0] {
                    logic.checkWinner(playerArray: logic.player1Array ?? [])
                } else {
                    logic.checkWinner(playerArray: logic.player2Array ?? [])
                }
            default: return
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        isPlayerTurn = [receivingPlayer1?.isTurn ?? false, receivingPlayer2?.isTurn ?? false]
        lblName.text = receivingPlayer1?.name
    }
}
