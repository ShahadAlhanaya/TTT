//
//  ViewController.swift
//  TTT
//
//  Created by Shahad Nasser on 01/12/2021.
//

import UIKit

class ViewController: UIViewController {
    //Game Labels
    @IBOutlet weak var turnLabel: UILabel!
    @IBOutlet weak var winnerLabel: UILabel!
    
    //Game Buttons
    @IBOutlet weak var resetButton: UIButton!
    
    @IBOutlet weak var block1: UIButton!
    @IBOutlet weak var block2: UIButton!
    @IBOutlet weak var block3: UIButton!
    
    @IBOutlet weak var block4: UIButton!
    @IBOutlet weak var block5: UIButton!
    @IBOutlet weak var block6: UIButton!
    
    @IBOutlet weak var block7: UIButton!
    @IBOutlet weak var block8: UIButton!
    @IBOutlet weak var block9: UIButton!
    
    //Other variables
    var board = Board() // this class holds the data of the game
    var gameOver = false //indicator for when game is over (either with a Win or a Draw)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //start a new game when view load
        resetGame()
    }
    
    @IBAction func boardPressed(_ sender: UIButton) {
        //check if blocked has not been pressed and game is not over
        if(board.getBlockStatus(tag: sender.tag) == BlockStatus.none && !gameOver){
            
            //get block status (red or blue) based on turn
            let status = board.getTurnBlockStatus()
            
            //change block status in board class
            board.changeBlockStatus(tag: sender.tag, status: status)
            //change block UI color based on status
            if(status == BlockStatus.red) {
                sender.backgroundColor = UIColor(named: "game_red")
            }
            else {
                sender.backgroundColor = UIColor(named: "game_blue")
            }
            
            //check if a player won or not
            if(board.checkWin()){
                //in case a player wins, end the game (this means players wont be able to click on empty blocks)
                gameOver = true
                
                //change UI of game based on winner
                if(board.getTurn() == Turn.red){
                    winnerLabel.text = "Red Wins!"
                    winnerLabel.textColor = UIColor(named: "game_red")
                    winnerLabel.isHidden = false
                    turnLabel.isHidden = true
                }else{
                    winnerLabel.text = "Blue Wins!"
                    winnerLabel.textColor = UIColor(named: "game_blue")
                    winnerLabel.isHidden = false
                    turnLabel.isHidden = true
                }
                
            }else{
                //else no one wins
                //check if the game is over (this means all blocks has been pressed and no empty blocks)
                if(board.checkGameOver()){
                    //change UI of game to Draw
                    winnerLabel.text = "Draw!"
                    winnerLabel.textColor = UIColor.systemIndigo
                    winnerLabel.isHidden = false
                    turnLabel.isHidden = true
                }else{
                    //else the game is not over change to other player turn
                    board.changeTurn()
                    //change turn label based on current turn
                    if(board.getTurn() == Turn.red){
                        turnLabel.text = "Red turn"
                        turnLabel.textColor = UIColor(named: "game_red")
                    }else{
                        turnLabel.text = "Blue turn"
                        turnLabel.textColor = UIColor(named: "game_blue")
                    }
                }
            }
            
        }
    }
    
    @IBAction func resetButtonPressed(_ sender: UIButton) {
        resetGame()
    }
    
    func resetGame(){
        turnLabel.text = "Red Starts!"
        turnLabel.textColor = UIColor(named: "game_red")
        turnLabel.isHidden = false
        winnerLabel.isHidden = true
        gameOver = false
        board.resetBoard()
        
        block1.backgroundColor = UIColor(named: "beige_buttons")
        block2.backgroundColor = UIColor(named: "beige_buttons")
        block3.backgroundColor = UIColor(named: "beige_buttons")
        
        block4.backgroundColor = UIColor(named: "beige_buttons")
        block5.backgroundColor = UIColor(named: "beige_buttons")
        block6.backgroundColor = UIColor(named: "beige_buttons")
        
        block7.backgroundColor = UIColor(named: "beige_buttons")
        block8.backgroundColor = UIColor(named: "beige_buttons")
        block9.backgroundColor = UIColor(named: "beige_buttons")
    }
}


