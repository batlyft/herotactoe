//
//  ViewController.swift
//  BvSTicTacToe
//
//  Created by Bat Computer on 10/13/15.
//  Copyright © 2015 HardSoft. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var activePlayer = 1
    
    var gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    
    let winningCombinations = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
    
    var gameActive = true

    @IBOutlet var button: UIButton!
    
    @IBOutlet var rematchButton: UIButton!
    
    @IBAction func rematch(sender: AnyObject) {
        
        gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
        
        activePlayer = 1
        
        gameActive = true
        
        gameOverLabel.hidden = true
        
        gameOverLabel.center = CGPointMake(gameOverLabel.center.x - 500, gameOverLabel.center.y)
        
        rematchButton.hidden = true
        
        rematchButton.center = CGPointMake(rematchButton.center.x - 500, rematchButton.center.y)
        
        var buttonToClear : UIButton
        
        for var i = 0; i < 9; i++ {
            
            buttonToClear = view.viewWithTag(i) as! UIButton
            
            buttonToClear.setImage(nil, forState: .Normal)
            
            
            
        }
        
    }
    
    
    @IBOutlet var gameOverLabel: UILabel!
    
    @IBAction func buttonPressed(sender: AnyObject) {
        
        if (gameState[sender.tag] == 0 && gameActive == true) {
            
            gameState[sender.tag] = activePlayer
        
            if activePlayer == 1 {
        
                sender.setImage(UIImage(named: "bmlogo.png"), forState: .Normal)
            
                activePlayer = 2
            
        } else {
            
                sender.setImage(UIImage(named: "smlogo.png"), forState: .Normal)
            
                activePlayer = 1
        }
            
            for combination in winningCombinations {
                
                if (gameState[combination[0]] != 0 && gameState[combination[0]] == gameState[combination[1]] && gameState[combination[1]] == gameState[combination[2]]) {
                    
                    gameActive = false
                    
                    if gameState[combination[0]] == 1 {
                        
                        gameOverLabel.text = "Batman Wins!"
                        
                    } else {
                        
                        gameOverLabel.text = "Superman Wins!"
                        
                    }
                    
                    endGame()
                    
                }
                
            }
            
            if gameActive == true {
            
                gameActive = false
            
                    for buttonState in gameState {
                        
                        if buttonState == 0 {
                    
                            gameActive = true
                    
                        }
                
                }
            
                if gameActive == false {
                
                    gameOverLabel.text = "The Heroes Tie"
                
                    endGame()
                
                }
                
            }
            
        }
        
    }
    
    func endGame() {
        
        gameOverLabel.hidden = false
        
        rematchButton.hidden = false
        
        UIView.animateWithDuration(0.5, animations: { () -> Void in
            
            self.gameOverLabel.center = CGPointMake(self.gameOverLabel.center.x + 500, self.gameOverLabel.center.y)
            
            self.rematchButton.center = CGPointMake(self.rematchButton.center.x + 500, self.rematchButton.center.y)
        })
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        gameOverLabel.hidden = true
        
        gameOverLabel.center = CGPointMake(gameOverLabel.center.x - 500, gameOverLabel.center.y)
        
        rematchButton.hidden = true
        
        rematchButton.center = CGPointMake(rematchButton.center.x - 500, rematchButton.center.y)    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

