//
//  TicTacToe.swift
//  TicTacToe
//
//  Created by teacher on 8/22/16.
//  Copyright © 2016 Swastik Brahma. All rights reserved.
//

import UIKit

class TicTacToeViewController: UIViewController {
    var game = TicTacToeBrain()
    override func viewDidLoad() {
        super.viewDidLoad()
        startNewGame()
    }
    @IBOutlet var buttons: [UIButton]!
    
    var winnerArray = [[0,0,1,0,1,0,1,0,0],[0,1,0,0,1,0,0,1,0],[1,0,0,1,0,0,1,0,0],[0,0,1,0,0,1,0,0,1],[0,0,0,0,0,0,1,1,1],[1,0,0,0,1,0,0,0,1],[1,1,1,0,0,0,0,0,0],[0,0,0,1,1,1,0,0,0]]
    
    var clickCount:Int!
   
    @IBAction func buttonPressed(button: UIButton) {
        for i in 0...8{
            if(button.tag == buttons[i].tag && button.currentTitle == nil){
                clickCount = clickCount+1
                if(game.playerIdentity == 1 ){
                    button.setTitle("X", forState: .Normal)
                    game.player1Array![i] = 1
                    if(clickCount >= 5){
                        if(game.winCondition(game.player1Array!)){
                            winnerTitleGreen(winnerArray[game.combination])
                            gameOverWithWinner(game.playerIdentity)
                        }
                        if(clickCount == 9){
                            gameOverWithWinner(nil)
                        }
                    }
                    game.changeIdentity()
                    
                }
                else if game.playerIdentity == 2 {
                    button.setTitle("O", forState: .Normal)
                    game.player2Array![i] = 1
                    if(clickCount >= 5){
                        if(game.winCondition(game.player2Array!)){
                            winnerTitleGreen(winnerArray[game.combination
                                ])
                            gameOverWithWinner(game.playerIdentity)
                        }
                        if(clickCount == 9){
                            gameOverWithWinner(nil)
                        }
                    }
                    game.changeIdentity()
                    
                }
            }
        }
    }
    
    func winnerTitleGreen(board2: Array<Int>){
        for i in 0...8 {
            if(board2[i] == 1){
                buttons[i].setTitleColor(UIColor.greenColor(), forState: .Normal)
            }
        }
    }
    
    func gameOverWithWinner(playerID: Int?) {
        let title = "Game Over"
        var message = String()
        
        if let ID = playerID {
            message = "Player \(ID) wins"
        }
        else {
            message = "No Winner"
        }
        
        let ac = UIAlertController(title: title,
                                   message: message,
                                   preferredStyle: .ActionSheet)
        
        let newGameAction = UIAlertAction(title: "New Game",
                                          style: .Default ,
                                          handler: { (action) -> Void in
                                            self.startNewGame()
        })
        ac.addAction(newGameAction)
        
        presentViewController(ac, animated: true, completion: nil)
    }
    
    
  
    func startNewGame() {
        clickCount = 0
        for i in 0...8 {
            buttons[i].setTitleColor(UIColor.redColor(), forState: UIControlState.Normal)
            buttons[i].backgroundColor = UIColor.grayColor()
            buttons[i].setTitle(nil, forState: .Normal)
            
            game.resetGame()
        }
    }
    
    
}
