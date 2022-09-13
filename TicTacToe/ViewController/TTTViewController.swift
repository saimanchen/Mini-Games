import UIKit

class TTTViewController: UIViewController {
    
    var receivingName1: String?
    var receivingName2: String?
    
    var logic: Logic = Logic()
    var ui: UI = UI()
    
    
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblPlayer1Name: UILabel!
    @IBOutlet weak var lblPlayer2Name: UILabel!
    @IBOutlet weak var lblPlayer1Score: UILabel!
    @IBOutlet weak var lblPlayer2Score: UILabel!
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
        logic.isPlayerTurn = [logic.player1.isTurn, logic.player2.isTurn]
        print(logic.isPlayerTurn)
        lblName.text = receivingName1
        lblPlayer1Name.text = receivingName1
        lblPlayer2Name.text = receivingName2
    }
    
    // this function calls all the methods
    func gamePlay(tag: Int) {
//        if let isPlayerTurn = logic.isPlayerTurn,
        if let receivingName1 = receivingName1,
           let receivingName2 = receivingName2 {
            
            logic.isGameStarted = true
            
            if logic.isGameStarted {
                btnResetPlayAgain.isHidden = false;

            }
            
            imgButtons[tag].setImage(ui.getImage(isPlayerTurn: logic.isPlayerTurn), for: .normal)
            logic.isPlayerTurn = logic.toggleTurn(isPlayerTurn: logic.isPlayerTurn)
            print(logic.isPlayerTurn)
            lblName.text = ui.getPlayerName(isPlayerTurn: logic.isPlayerTurn, name1: receivingName1, name2: receivingName2)
            logic.appendToPlayerArray(isPlayerTurn: logic.isPlayerTurn, index: tag)
            
            if logic.isTapped[tag] == false {
                logic.isTapped[tag] = true
                imgButtons[tag].isUserInteractionEnabled = false
            } else if logic.isTapped[tag] == true {
                imgButtons[tag].isUserInteractionEnabled = false
            }
            
            if logic.isPlayerTurn[0] {
                logic.hasWon = logic.checkWinner(playerArray: logic.player1Array)
            } else {
                logic.hasWon = logic.checkWinner(playerArray: logic.player2Array)
            }
            
            if logic.hasWon {
                ui.disableAllButtons(UIButtons: imgButtons)
                logic.updateScore()
                lblPlayer1Score.text = String(logic.player1.score)
                lblPlayer2Score.text = String(logic.player2.score)
            }
            
            logic.checkDraw()
        }
    }
    
}

// MARK: TODO:
// reset game
// score
// "computer"
