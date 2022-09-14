import UIKit

class TTTViewController: UIViewController {
    
    var receivingName1: String?
    var receivingName2: String?
    var isComputerGame: Bool = false
    
    var game: Game = Game(player1: Player(name: "Player 1", isTurn: true, score: 0), player2: Player(name: "Player 2", isTurn: false, score: 0), computer: Player(name: "Computer", isTurn: false, score: 0))
    
    
    @IBOutlet weak var lblTitle: UILabel!
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
        
        if isComputerGame {
            switch tag {
            case 0: print(tag)
            case 1: print(tag)
            case 2: print(tag)
            case 3: print(tag)
            case 4: print(tag)
            case 5: print(tag)
            case 6: print(tag)
            case 7: print(tag)
            case 8: print(tag)
            default: return
            }
        } else {
            switch tag {
            case 0: twoPlayerGame(tag: tag)
            case 1: twoPlayerGame(tag: tag)
            case 2: twoPlayerGame(tag: tag)
            case 3: twoPlayerGame(tag: tag)
            case 4: twoPlayerGame(tag: tag)
            case 5: twoPlayerGame(tag: tag)
            case 6: twoPlayerGame(tag: tag)
            case 7: twoPlayerGame(tag: tag)
            case 8: twoPlayerGame(tag: tag)
            default: return
            }
        }
        
    }
    
    @IBAction func onResetPlayAgain(_ sender: UIButton) {
        if let receivingName1 = receivingName1,
           let receivingName2 = receivingName2 {
            
            game.blankAllButtons(UIButtons: imgButtons)
            game.enableAllButtons(UIButtons: imgButtons)
            lblTitle.text = "Turn to play:"
            lblName.text = game.getPlayerName(isPlayerTurn: game.isPlayerTurn, name1: receivingName1, name2: receivingName2)
            game.onReset()
            btnResetPlayAgain.isHidden = true
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if isComputerGame {
            game.isPlayerTurn = [game.player1.isTurn, game.computer.isTurn]
            print(game.isPlayerTurn)
            lblName.text = receivingName1
            lblPlayer1Name.text = receivingName1
            lblPlayer2Name.text = game.computer.name
            print(isComputerGame)
        } else {
            game.isPlayerTurn = [game.player1.isTurn, game.player2.isTurn]
            lblPlayer1Name.text = receivingName1
            lblPlayer2Name.text = receivingName2
            lblName.text = receivingName1
        }
    }
    
    func computerGame(tag: Int) {
        
    }
    
    // 2 players game - this function calls all the methods
    func twoPlayerGame(tag: Int) {
        if let receivingName1 = receivingName1,
           let receivingName2 = receivingName2 {
            
            game.isGameStarted = true
            
            if game.isGameStarted {
                btnResetPlayAgain.setTitle("Reset game", for: .normal)
                btnResetPlayAgain.isHidden = false;

            }
            
            imgButtons[tag].setImage(game.getImage(isPlayerTurn: game.isPlayerTurn), for: .normal)
            game.isPlayerTurn = game.toggleTurn(isPlayerTurn: game.isPlayerTurn)
            print(game.isPlayerTurn)
            lblName.text = game.getPlayerName(isPlayerTurn: game.isPlayerTurn, name1: receivingName1, name2: receivingName2)
            game.appendToPlayerArray(isPlayerTurn: game.isPlayerTurn, index: tag)
            
            if game.isTapped[tag] == false {
                game.isTapped[tag] = true
                imgButtons[tag].isUserInteractionEnabled = false
            } else if game.isTapped[tag] == true {
                imgButtons[tag].isUserInteractionEnabled = false
            }
            
            if game.isPlayerTurn[0] {
                game.hasWon = game.checkIfWon(playerArray: game.player1Array)
            } else {
                game.hasWon = game.checkIfWon(playerArray: game.player2Array)
            }
            
            if game.hasWon {
                lblTitle.text = "Winner:"
                let winner = game.getWinnerName()
                
                if winner == 0 {
                    lblName.text = receivingName1
                } else if winner == 1 {
                    lblName.text = receivingName2
                } else {
                    lblName.text = "Error"
                }
                
                game.disableAllButtons(UIButtons: imgButtons)
                game.updateScore()
                lblPlayer1Score.text = String(game.player1.score)
                lblPlayer2Score.text = String(game.player2.score)
                btnResetPlayAgain.setTitle("Play again", for: .normal)
                game.isGameStarted = false
            }
            
            game.isDraw = game.checkDraw()
            
            if game.isDraw {
                lblTitle.text = ""
                lblName.text = "Draw"
                btnResetPlayAgain.setTitle("Play again", for: .normal)
                game.isGameStarted = false
            }
            
            print(game.getRandomInt())
        }
    }
}

// MARK: TODO:
// "computer"
