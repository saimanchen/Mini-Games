import UIKit

class TTTFormViewController: UIViewController {
    
    @IBOutlet weak var tfPlayer1: UITextField!
    @IBOutlet weak var tfPlayer2: UITextField!
    @IBOutlet weak var switchComputer: UISwitch!
    
    let formToTTTSegue: String = "formToTTTSegue"
    var isComputerGame: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tfPlayer1.layer.borderWidth = 2
        tfPlayer1.layer.borderColor = UIColor.black.cgColor
        tfPlayer2.layer.borderWidth = 2
        tfPlayer2.layer.borderColor = UIColor.black.cgColor
    }
    
    @IBAction func btnPlay(_ sender: Any) {
    }
    
    @IBAction func SwitchAction(_ sender: UISwitch) {
        if sender.isOn {
            isComputerGame = true
            tfPlayer2.isHidden = true
        } else {
            isComputerGame = false
            tfPlayer2.isHidden = false
        }
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
            
            if isComputerGame {
                destinationVC.isComputerGame = true
                destinationVC.receivingName1 = tfPlayer1.text
                destinationVC.receivingName2 = "Computer"
            } else {
                destinationVC.isComputerGame = false
                destinationVC.receivingName1 = tfPlayer1.text
                destinationVC.receivingName2 = tfPlayer2.text
            }
        }
    }
}
