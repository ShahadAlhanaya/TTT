import Foundation
import UIKit

class Board{
    var blocks: [Block]
    var turn: Turn
    var winner: Turn
    
    init(){
        blocks = [
            Block(tag: "1", status: BlockStatus.none),
            Block(tag: "2", status: BlockStatus.none),
            Block(tag: "3", status: BlockStatus.none),
            Block(tag: "4", status: BlockStatus.none),
            Block(tag: "5", status: BlockStatus.none),
            Block(tag: "6", status: BlockStatus.none),
            Block(tag: "7", status: BlockStatus.none),
            Block(tag: "8", status: BlockStatus.none),
            Block(tag: "9", status: BlockStatus.none),
        ]
        turn = Turn.red
        winner = Turn.red
    }
    
    check 
    
    
}

class Block{
    var tag: String
    var status: BlockStatus
    
    init(tag: String, status: BlockStatus){
        self.tag = tag
        self.status = status
    }
}

enum BlockStatus{
    case none
    case red
    case blue
}

enum Turn{
    case red
    case blue
}
