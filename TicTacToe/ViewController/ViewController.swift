//
//  ViewController.swift
//  TicTacToe
//
//  Created by Saiman Chen on 2022-09-06.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var stackTTT: UIStackView!
    

    @IBAction func btnTTT(_ sender: Any) {
        stackTTT.isHidden = false
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

