//
//  FormViewController.swift
//  TicTacToe
//
//  Created by Saiman Chen on 2022-09-06.
//

import UIKit

class FormViewController: UIViewController {
    @IBOutlet weak var tfPlayer1: UITextField!
    @IBOutlet weak var tfPlayer2: UITextField!
    
    let formToTTTSegue: String = "formToTTTSegue"
    
    var player1: Player?
    var player2: Player?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnPlay(_ sender: Any) {
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == formToTTTSegue {
            let destinationVC = segue.destination as! TTTViewController
            
            destinationVC.receivingPlayer1 = Player(name: tfPlayer1.text ?? "Player 1", isTurn: true)
            destinationVC.receivingPlayer2 = Player(name: tfPlayer2.text ?? "Player 2", isTurn: false)
        }
    }
}
