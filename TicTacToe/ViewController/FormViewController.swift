import UIKit

class FormViewController: UIViewController {
    @IBOutlet weak var tfPlayer1: UITextField!
    @IBOutlet weak var tfPlayer2: UITextField!
    
    let formToTTTSegue: String = "formToTTTSegue"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnPlay(_ sender: Any) {
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == formToTTTSegue {
            let destinationVC = segue.destination as! TTTViewController
            
            if tfPlayer1.text == "" {
                tfPlayer1.text = "Player 1"
            }
            
            if tfPlayer2.text == "" {
                tfPlayer2.text = "Player 2"
            }
            
            destinationVC.receivingPlayer1 = Player(name: tfPlayer1.text ?? "Player 1", isTurn: true, isWinner: false, score: 0)
            destinationVC.receivingPlayer2 = Player(name: tfPlayer2.text ?? "Player 2", isTurn: false, isWinner: false, score: 0)
        }
    }
}
