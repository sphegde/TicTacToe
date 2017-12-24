//
//  TicTacToe.swift
//  TicTacToe
//
//  Created by teacher on 8/22/16.
//  Copyright © 2016 Swastik Brahma. All rights reserved.
//

import UIKit

class TicTacToeBrain {
    var count: Int = 0
    var combination:Int!
    var playerIdentity: Int = 1
    var count1:Int = 0
    var player1Array:Array<Int>?
    var player2Array:Array<Int>?
    
    var array1 = [0,0,1,0,1,0,1,0,0]
    var array2 = [0,1,0,0,1,0,0,1,0]
    var array3 = [1,0,0,1,0,0,1,0,0]
    var array4 = [0,0,1,0,0,1,0,0,1]
    var array5 = [0,0,0,0,0,0,1,1,1]
    var array6 = [1,0,0,0,1,0,0,0,1]
    var array7 = [1,1,1,0,0,0,0,0,0]
    var array8 = [0,0,0,1,1,1,0,0,0]
    
    func changeIdentity(){
        if(playerIdentity == 1){
        playerIdentity = 2
        }
        else{
        playerIdentity = 1
        }
    }
    func winCondition(playerArray: Array<Int>) -> Bool {
        if(compare(playerArray, winCombination: array1)){
            combination = 0
        return true
        }
        else if(compare(playerArray, winCombination: array2)){
            combination = 1
            return true
        }
        else if(compare(playerArray, winCombination: array3)){
            combination = 2
            return true
        }
        else if(compare(playerArray, winCombination: array4)){
            combination = 3
            return true
        }
        else if(compare(playerArray, winCombination: array5)){
            combination = 4
            return true
        }
        else if(compare(playerArray, winCombination: array6)){
            combination = 5
            return true
        }
        else if(compare(playerArray, winCombination: array7)){
            combination = 6
            return true
        }
        else if(compare(playerArray, winCombination: array8)){
            combination = 7
            return true
        }
        else{
        return false
        }
    }
    func compare(winningArray: Array<Int>, winCombination: Array<Int>) -> Bool{
        count1 = 0
        for i in 0...8{
            if(winningArray[i] == winCombination[i] && winningArray[i] == 1){
                count1 = count1+1
                print("Count: \(count1)")
            if(count1 >= 3){
            return true
            }
            }
    }
        return false
    }
    func resetGame() {
        playerIdentity = 1
        player1Array=[0,0,0,0,0,0,0,0,0]
        player2Array=[0,0,0,0,0,0,0,0,0]
    
    
    }
    
    
    
}
