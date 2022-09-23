import UIKit

class MemoryViewController: UIViewController {
    
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblPlayer1ScoreName: UILabel!
    @IBOutlet weak var lblPlayer2ScoreName: UILabel!
    @IBOutlet weak var lblPlayer1Pairs: UILabel!
    @IBOutlet weak var lblPlayer2Pairs: UILabel!
    @IBOutlet weak var lblPlayer1Score: UILabel!
    @IBOutlet weak var lblPlayer2Score: UILabel!
    @IBOutlet var UIButtons: [UIButton]!
    
    // values received from MemoryFormViewController
    var receivingName1: String?
    var receivingName2: String?
    var isComputerGame: Bool = false
    
    var game: MemoryGame = MemoryGame(player1: Player(name: "Player 1", isTurn: true, score: 0, isComputer: false), player2: Player(name: "Player 2", isTurn: false, score: 0, isComputer: false))
    
    var shuffledCellArray: Array<String> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // sets all labels with player names
        if let receivingName1 = receivingName1,
           let receivingName2 = receivingName2 {
            game.player1.name = receivingName1
            game.player2.name = receivingName2
            lblName.text = game.player1.name
            lblPlayer1ScoreName.text = game.player1.name
            lblPlayer2ScoreName.text = game.player2.name
            
            shuffledCellArray = game.shuffleCells()
        }
    }
    
    @IBAction func onPress(_ sender: UIButton) {
        let tag = sender.tag
        
        cellOnPress(tag: tag)
    }
    
    @IBAction func btnResetPlayAgain(_ sender: Any) {
        print("hello reset")
        }
    
    func cellOnPress(tag: Int) {
        
        if game.chosenCells.count == 0 {
            game.firstTag = tag
        }
        
        // opens the cell and gets the image
        UIButtons[tag].setImage(getImage(tag: tag), for: .normal)
        
        if game.chosenCells.count < 2 {
            game.chosenCells.append(shuffledCellArray[tag])
        }
        
        if game.chosenCells.count == 2 {
            game.isAMatch = game.isAMatch(array: game.chosenCells)
        }

        if game.isAMatch && game.chosenCells.count == 2 {
            print("isAMatch")
            UIButtons[tag].isUserInteractionEnabled = false
            UIButtons[game.firstTag ?? -1].isUserInteractionEnabled = false
            game.chosenCells = []
            game.isAMatch = false
            game.updatePlayerPairs(isPlayerTurn: game.isPlayerTurn)
            lblPlayer1Pairs.text = String(game.player1Pairs)
            lblPlayer2Pairs.text = String(game.player2Pairs)
        } else if !game.isAMatch && game.chosenCells.count == 2 {
            delayTimer(firstTag: game.firstTag ?? -1, tag: tag)
            game.chosenCells = []
            game.isPlayerTurn = game.toggleTurn(isPlayerTurn: game.isPlayerTurn)
            lblName.text = getPlayerName(isPlayerTurn: game.isPlayerTurn, name1: game.player1.name, name2: game.player2.name)
        }
    }
    
    func getImage(tag: Int) -> UIImage {
        let image = self.shuffledCellArray[tag]
        return UIImage(named: image) ?? UIImage(named: "memory_blank")!
    }
    
    func delayTimer(firstTag: Int, tag: Int) {
        _ = Timer.scheduledTimer(
            withTimeInterval: 1,
            repeats: false
        ) { timer in
            self.toggleBackToBlank(firstTag: firstTag, tag: tag)
            }
    }
    
    func toggleBackToBlank(firstTag: Int, tag: Int) {
        UIButtons[firstTag].setImage(UIImage(named: "memory_blank"), for: .normal)
        UIButtons[tag].setImage(UIImage(named: "memory_blank"), for: .normal)
    }
    
    func getPlayerName(isPlayerTurn: Array<Bool>, name1: String, name2: String) -> String {
        if game.isPlayerTurn[0] {
            return name1
        } else if game.isPlayerTurn[1] {
            return name2
        }
        return "Error"
    }
}
