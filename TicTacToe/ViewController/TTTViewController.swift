import UIKit

class TTTViewController: UIViewController {
    
    var receivingPlayer1: Player?
    var receivingPlayer2: Player?
    
    var logic: Logic = Logic()
    var ui: UI = UI()
    
    
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var btnResetPlayAgain: UIButton!
    
    // Image buttons
    @IBOutlet var imgButtons: [UIButton]!
    @IBAction func onPress(_ sender: UIButton) {
        let tag = sender.tag
        switch tag {
        case 0: gamePlay(tag: tag)
        case 1: gamePlay(tag: tag)
        case 2: gamePlay(tag: tag)
        case 3: gamePlay(tag: tag)
        case 4: gamePlay(tag: tag)
        case 5: gamePlay(tag: tag)
        case 6: gamePlay(tag: tag)
        case 7: gamePlay(tag: tag)
        case 8: gamePlay(tag: tag)
        default: return
        }
    }
    
    @IBAction func onResetPlayAgain(_ sender: UIButton) {
        ui.onReset(UIButtons: imgButtons)
        ui.enableAllButtons(UIButtons: imgButtons)
        logic.onReset()
        btnResetPlayAgain.isHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        logic.isPlayerTurn = [receivingPlayer1?.isTurn ?? false, receivingPlayer2?.isTurn ?? false]
        lblName.text = receivingPlayer1?.name
    }
    
    // this function calls all the methods
    func gamePlay(tag: Int) {
        if let isPlayerTurn = logic.isPlayerTurn,
           let receivingPlayer1 = receivingPlayer1,
           let receivingPlayer2 = receivingPlayer2 {
            
            logic.isGameStarted = true
            
            if logic.isGameStarted {
                btnResetPlayAgain.isHidden = false;

            }
            
            imgButtons[tag].setImage(ui.getImage(isPlayerTurn: isPlayerTurn), for: .normal)
            logic.isPlayerTurn = logic.toggleTurn(isPlayerTurn: isPlayerTurn)
            lblName.text = ui.getPlayerName(isPlayerTurn: isPlayerTurn, name1: receivingPlayer1.name, name2: receivingPlayer2.name)
            logic.appendToPlayerArray(isPlayerTurn: isPlayerTurn, index: tag)
            
            if logic.isTapped[tag] == false {
                logic.isTapped[tag] = true
                imgButtons[tag].isUserInteractionEnabled = false
            } else if logic.isTapped[tag] == true {
                imgButtons[tag].isUserInteractionEnabled = false
            }
            
            if isPlayerTurn[0] {
                logic.hasWon = logic.checkWinner(playerArray: logic.player1Array)
            } else {
                logic.hasWon = logic.checkWinner(playerArray: logic.player2Array)
            }
            
            if logic.hasWon {
                ui.disableAllButtons(UIButtons: imgButtons)
            }
            
            logic.checkDraw()
        }
    }
    
}

// MARK: TODO:
// reset game
// score
// "computer"
