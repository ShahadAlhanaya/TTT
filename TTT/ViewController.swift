//
//  ViewController.swift
//  TTT
//
//  Created by Shahad Nasser on 01/12/2021.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var turnLabel: UILabel!
    @IBOutlet weak var winnerLabel: UILabel!
    @IBOutlet weak var resetButton: UIButton!
    
    @IBOutlet weak var TLButton: UIButton!
    @IBOutlet weak var TCButton: UIButton!
    @IBOutlet weak var TRButton: UIButton!
    
    @IBOutlet weak var CLButton: UIButton!
    @IBOutlet weak var CCButton: UIButton!
    @IBOutlet weak var CRButton: UIButton!
    
    @IBOutlet weak var BLButton: UIButton!
    @IBOutlet weak var BCButton: UIButton!
    @IBOutlet weak var BRButton: UIButton!
    
//    var turn = Turn.Red
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resetGame()
        
    }
    
    @IBAction func resetButtonPressed(_ sender: UIButton) {
        resetGame()
        
    }
    
    
    func startGame(){
        
    }
    
    func resetGame(){
//        turn = Turn.Red
        turnLabel.text = "Red Starts!"
        winnerLabel.text = "Winner"
        winnerLabel.isHidden = true
        
        TLButton.backgroundColor = UIColor(named: "beige_buttons")
        TCButton.backgroundColor = UIColor(named: "beige_buttons")
        TRButton.backgroundColor = UIColor(named: "beige_buttons")
        
        CLButton.backgroundColor = UIColor(named: "beige_buttons")
        CCButton.backgroundColor = UIColor(named: "beige_buttons")
        CRButton.backgroundColor = UIColor(named: "beige_buttons")
        
        BLButton.backgroundColor = UIColor(named: "beige_buttons")
        BCButton.backgroundColor = UIColor(named: "beige_buttons")
        BRButton.backgroundColor = UIColor(named: "beige_buttons")
    }
    
    
}


