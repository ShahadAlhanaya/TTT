import Foundation
import UIKit

class Board{
    //a board has 9 blocks
    private var block1 = Block(tag: "1", status: BlockStatus.none)
    private var block2 = Block(tag: "2", status: BlockStatus.none)
    private var block3 = Block(tag: "3", status: BlockStatus.none)
    private var block4 = Block(tag: "4", status: BlockStatus.none)
    private var block5 = Block(tag: "5", status: BlockStatus.none)
    private var block6 = Block(tag: "6", status: BlockStatus.none)
    private var block7 = Block(tag: "7", status: BlockStatus.none)
    private var block8 = Block(tag: "8", status: BlockStatus.none)
    private var block9 = Block(tag: "9", status: BlockStatus.none)
    
    //current turn of game, it always starts with red
    private var turn = Turn.red
    
    //returns the turn since it is private
    func getTurn()-> Turn{
        return turn
    }
    
    //change value of the turn
    func changeTurn(){
        if(turn == Turn.red){
            turn = Turn.blue
        }else {
            turn = Turn.red
        }
    }
    
    //this return the blocked status based on turn
    func getTurnBlockStatus()-> BlockStatus{
        if(turn == Turn.red) {
            return BlockStatus.red
            
        }
        else {
            return BlockStatus.blue
            
        }
    }
    
    //this change specific block status based on tag
    func changeBlockStatus(tag: Int, status: BlockStatus){
        switch tag{
        case 1:  block1.status = status
        case 2:  block2.status = status
        case 3:  block3.status = status
        case 4:  block4.status = status
        case 5:  block5.status = status
        case 6:  block6.status = status
        case 7:  block7.status = status
        case 8:  block8.status = status
        case 9:  block9.status = status
        default:  print("no such block")
        }
    }
    
    //this returns specific block status based on tag
    func getBlockStatus(tag: Int)-> BlockStatus{
        switch tag{
        case 1: return block1.status
        case 2: return block2.status
        case 3: return block3.status
        case 4: return block4.status
        case 5: return block5.status
        case 6: return block6.status
        case 7: return block7.status
        case 8: return block8.status
        case 9: return block9.status
        default: return BlockStatus.none
        }
    }
    
    //checks rows, columns, and diagonals
    func checkWin()-> Bool{
        let color = getTurnBlockStatus()
        if(checkRows(color: color) || checkColumns(color: color) || checkDiagonals(color: color)){
            return true
        }
        return false
    }
    
    //check if all blocks were pressed and not empty, in this case the game is considered over
    func checkGameOver()-> Bool{
        if(block1.status != BlockStatus.none &&
           block2.status != BlockStatus.none &&
           block3.status != BlockStatus.none &&
           block4.status != BlockStatus.none &&
           block5.status != BlockStatus.none &&
           block6.status != BlockStatus.none &&
           block7.status != BlockStatus.none &&
           block8.status != BlockStatus.none &&
           block9.status != BlockStatus.none ){
            
            return true
        }
        return false
    }
    
    //check wining row combinations for a specific color
    func checkRows(color: BlockStatus)-> Bool{
        if(block1.status == color && block2.status == color && block3.status == color){
            return true
        }
        else if(block4.status == color && block5.status == color && block6.status == color){
            return true
        }
        else if(block7.status == color && block8.status == color && block9.status == color){
            return true
        }
        return false
    }
    
    //check wining column combinations for a specific color
    func checkColumns(color: BlockStatus)-> Bool{
        if(block1.status == color && block4.status == color && block7.status == color){
            return true
        }
        else if(block2.status == color && block5.status == color && block8.status == color){
            return true
        }
        else if(block3.status == color && block6.status == color && block9.status == color){
            return true
        }
        return false
    }
    
    //check wining diagonal combinations for a specific color
    func checkDiagonals(color: BlockStatus)-> Bool{
        if(block1.status == color && block5.status == color && block9.status == color){
            return true
        }
        else if(block3.status == color && block5.status == color && block7.status == color){
            return true
        }
        return false
    }
    
    //resets all board values
    func resetBoard(){
        block1.status = BlockStatus.none
        block2.status = BlockStatus.none
        block3.status = BlockStatus.none
        block4.status = BlockStatus.none
        block5.status = BlockStatus.none
        block6.status = BlockStatus.none
        block7.status = BlockStatus.none
        block8.status = BlockStatus.none
        block9.status = BlockStatus.none
        
        turn = Turn.red
    }
}

//each button is represented in a block
class Block{
    //tag that reflects button tag
    var tag: String
    //status can indicate color or empty
    var status: BlockStatus
    
    init(tag: String, status: BlockStatus){
        self.tag = tag
        self.status = status
    }
    
    
}

enum BlockStatus{
    case none //not pressed yet
    case red //pressed by red
    case blue //pressed by blue
}

//players turns
enum Turn{
    case red
    case blue
}
