import UIKit

class TTTComputerFormViewController: UIViewController {
    @IBOutlet weak var tfPlayer1: UITextField!
    
    var TTTComputerToTTTSegue: String = "TTTComputerToTTTSegue"
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == TTTComputerToTTTSegue {
            let destinationVC = segue.destination as! TTTViewController
            
            if tfPlayer1.text == "" {
                tfPlayer1.text = "Player 1"
            }
            
            destinationVC.receivingName1 = tfPlayer1.text
            destinationVC.isComputerGame = true
        }
    }
}
