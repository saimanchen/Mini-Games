//
//  MemoryViewController.swift
//  MiniGames
//
//  Created by Saiman Chen on 2022-09-21.
//

import UIKit

class MemoryViewController: UIViewController {
    
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblPlayer1ScoreName: UILabel!
    @IBOutlet weak var lblPlayer2ScoreName: UILabel!
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
            lblName.text = receivingName1
            lblPlayer1ScoreName.text = game.player1.name
            lblPlayer2ScoreName.text = game.player2.name
            
//            shuffledCellArray = game.cellArray.shuffled()
            
            shuffledCellArray = game.shuffleCells()
            
        }
    }
    
    @IBAction func onPress(_ sender: UIButton) {
        let tag = sender.tag
        
        print(tag)
        cellOnPress(tag: tag)
    }
    
    @IBAction func btnResetPlayAgain(_ sender: Any) {
        }
    
    func cellOnPress(tag: Int) {
        UIButtons[tag].setImage(getImage(tag: tag), for: .normal)
    }
    
    func getImage(tag: Int) -> UIImage {
        let image = self.shuffledCellArray[tag]
        return UIImage(named: image) ?? UIImage(named: "blank.png")!
    }
}
