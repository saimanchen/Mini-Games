import UIKit

class TTTViewController: UIViewController {
    
    // delays computer move
    var timer: Timer?
    
    // values received from other view controllers
    var receivingName1: String?
    var receivingName2: String?
    var isComputerGame: Bool = false
    
    var game: TicTacToeGame = TicTacToeGame(player1: Player(name: "Player 1", isTurn: true, score: 0, isComputer: false), player2: Player(name: "Player 2", isTurn: false, score: 0, isComputer: false))
    
    
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblPlayer1Name: UILabel!
    @IBOutlet weak var lblPlayer2Name: UILabel!
    @IBOutlet weak var lblPlayer1Score: UILabel!
    @IBOutlet weak var lblPlayer2Score: UILabel!
    @IBOutlet weak var btnResetPlayAgain: UIButton!
    
    override func viewDidLoad() {
            super.viewDidLoad()
            
            // sets all labels with player names
            if let receivingName1 = receivingName1,
               let receivingName2 = receivingName2 {
                game.player1.name = receivingName1
                game.player2.name = receivingName2
                lblName.text = receivingName1
                lblPlayer1Name.text = game.player1.name
                lblPlayer2Name.text = game.player2.name
                if isComputerGame { game.player2.isComputer = true }
            }
        }
    // Image buttons
    @IBOutlet var imgButtons: [UIButton]!
    @IBAction func onPress(_ sender: UIButton?) {
        var tag: Int?
        
        if game.player2.isComputer && game.isPlayerTurn[1] {
            tag = game.computerTurn()
        } else {
            tag = sender?.tag
        }
        
        switch tag {
        case 0: cellOnPress(tag: tag ?? 0)
        case 1: cellOnPress(tag: tag ?? 1)
        case 2: cellOnPress(tag: tag ?? 2)
        case 3: cellOnPress(tag: tag ?? 3)
        case 4: cellOnPress(tag: tag ?? 4)
        case 5: cellOnPress(tag: tag ?? 5)
        case 6: cellOnPress(tag: tag ?? 6)
        case 7: cellOnPress(tag: tag ?? 7)
        case 8: cellOnPress(tag: tag ?? 8)
        default: return
        }
    }
    
    @IBAction func onResetPlayAgain(_ sender: UIButton) {
        if let receivingName1 = receivingName1,
           let receivingName2 = receivingName2 {
            
            blankAllCells(UIButtons: imgButtons)
            enableAllCells(UIButtons: imgButtons)
            
            lblTitle.text = "Turn to play:"
            lblName.text = getPlayerName(isPlayerTurn: game.isPlayerTurn, name1: receivingName1, name2: receivingName2)
            btnResetPlayAgain.setImage(UIImage(named: "reset_game"), for: .normal)
            btnResetPlayAgain.isHidden = true

            game.onGameReset()
            
            // prompts the computer to make a move if computer is starting player
            if game.player2.isComputer && game.isPlayerTurn[1] {
                timer = Timer.scheduledTimer(withTimeInterval: 1.2, repeats: false, block: autoPress(timer:))
            }
        }
    }
    
    
    
    // this function is called when a cell is pressed
    func cellOnPress(tag: Int) {
        
        if let receivingName1 = receivingName1,
           let receivingName2 = receivingName2 {
            
            game.isGameStarted = true
            
            if game.isGameStarted {
                btnResetPlayAgain.isHidden = false;

            }
            
            imgButtons[tag].setImage(getImage(isPlayerTurn: game.isPlayerTurn), for: .normal)
            game.isPlayerTurn = game.toggleTurn(isPlayerTurn: game.isPlayerTurn)
            lblName.text = getPlayerName(isPlayerTurn: game.isPlayerTurn, name1: receivingName1, name2: receivingName2)
            game.appendToPlayerArray(isPlayerTurn: game.isPlayerTurn, index: tag)
            
            // disables the cell that was clicked
            if game.isButtonTapped[tag] == false {
                game.isButtonTapped[tag] = true
                imgButtons[tag].isUserInteractionEnabled = false
            }
            
            // checks if someone has won
            if game.isPlayerTurn[0] {
                game.hasWon = game.checkIfWon(playerArray: game.player1Array)
            } else {
                game.hasWon = game.checkIfWon(playerArray: game.player2Array)
            }
            
            if game.hasWon {
                lblTitle.text = "Winner:"
                let winner = getWinnerName()
                
                if winner == 0 {
                    lblName.text = receivingName1
                } else if winner == 1 {
                    lblName.text = receivingName2
                } else {
                    lblName.text = "Error"
                }
                
                disableAllCells(UIButtons: imgButtons)
                game.updateScore()
                lblPlayer1Score.text = String(game.player1.score)
                lblPlayer2Score.text = String(game.player2.score)
                btnResetPlayAgain.setImage(UIImage(named: "play_again"), for: .normal)
                game.isGameStarted = false
            }
            
            game.isDraw = game.checkIfDraw()
            
            if game.isDraw {
                lblTitle.text = ""
                lblName.text = "Draw"
                btnResetPlayAgain.setImage(UIImage(named: "play_again"), for: .normal)
                disableAllCells(UIButtons: imgButtons)
                game.isGameStarted = false
            }
            
            // prompts the computer to make a move if game is not ended
            if game.hasWon == false && game.isDraw == false && game.player2.isComputer {
                timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: false, block: autoPress(timer:))
            }
        }
    }
    
    func autoPress(timer: Timer) {
        onPress(nil)
    }
    
    // functions below manipulates the UI
    func getImage(isPlayerTurn: Array<Bool>) -> UIImage {
        if game.isPlayerTurn[0] {
            return UIImage(named: "TTT_circle.png") ?? UIImage(named: "blank.png")!
        } else if game.isPlayerTurn[1] {
            return UIImage(named: "TTT_cross.png") ?? UIImage(named: "blank.png")!
        }
        return UIImage(named: "TTT_blank.png") ?? UIImage(named: "blank.png")!
    }
    
    func getPlayerName(isPlayerTurn: Array<Bool>, name1: String, name2: String) -> String {
        if game.isPlayerTurn[0] {
            return name1
        } else if game.isPlayerTurn[1] {
            return name2
        }
        return "Error"
    }
    
    func getWinnerName() -> Int {
        if game.isPlayerTurn[0] {
            return 1
        } else if game.isPlayerTurn[1] {
            return 0
        }
        return 404
    }
    
    func disableAllCells(UIButtons: Array<UIButton>) {
        for button in UIButtons {
            button.isUserInteractionEnabled = false
            button.alpha = 0.8
        }
    }
    
    func enableAllCells(UIButtons: Array<UIButton>) {
        for button in UIButtons {
            button.isUserInteractionEnabled = true
            button.alpha = 1.0
        }
    }
    
    func blankAllCells(UIButtons: Array<UIButton>) {
        for button in UIButtons {
            button.setImage(UIImage(named: "TTT_blank.png"), for: .normal)
        }
    }
}
