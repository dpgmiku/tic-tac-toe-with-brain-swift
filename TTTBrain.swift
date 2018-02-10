//
//  TTTBrain.swift
//  TicTacToe
//
//  Created by admin on 10.05.17.
//  Copyright © 2017 s65229. All rights reserved.
//

import Foundation

class TTTBrain {
    
    var savestats = [0,0,0,0,0,0,0,0,0];
    var wins = [[1,2,3], [4,5,6], [7,8,9], [1,4,7], [2,5,8], [3,6,9],[1,5,9],[3,5,7]]
    
    //1 means x, 2 means O
    
    func save(_ position: Int, _ what: Int) {
        
        savestats[position]=what;
        
        
    }
    
    
    func checkWin() -> Int {
        
        
        for win in wins {
            
            if (savestats[win[0]-1] != 0 && savestats[win[0]-1] == savestats[win[1]-1] && savestats[win[1]-1] == savestats[win[2]-1]){
                
            return savestats[win[0]-1]
            }
            
            
        }
        
        if !(savestats.contains(0)) {
            
            return 3
        }
        
        return -1;
        
        
    }
    
    func computerPlay() -> Int{
    //check if you can win this game already
    if (findTwo(2) != -1){
     return findTwo(2)
    }
    //block him
    else if (findTwo(1) != -1){
    return findTwo(1)
   // else if
     //   for win in wins {
            
            
            
       // }
        //middle
    }
        else if (savestats[4]==0){
        return 4
        }
            
//opposite corner check
        else if (savestats[0]==1 && savestats[8] == 0){
        return 8
        }
        else if (savestats[0]==0 && savestats[8] == 1){
        return 0
        }
        else if (savestats[2]==1 && savestats[6] == 0){
            
        return 6
        }
        else if (savestats[2]==0 && savestats[6] == 1){
            
            return 2
        }
        //play corner
        else if (savestats[0]==0){
            
            return 0
        }
        else if (savestats[2]==0){
            return 2
        }
        else if (savestats[6]==0){
            
            return 6
        }
        else if (savestats[8]==0){
            
            return 8
        }
        //play an empty side
        else if (savestats[1]==0){
            
            return 1
        }
        else if (savestats[3]==0){
            
            return 3
        }
        else if (savestats[5]==0){
            
            return 5
        }
        else if (savestats[7]==0){
            
            return 7
        }
        
    return -1
    }
    
    func findTwo(_ what: Int) -> Int {
    
    for win in wins {
    if (savestats[win[0]-1]==0 && savestats[win[1]-1] == what && savestats[win[2]-1] == what){
        return win[0]-1
    }
    if (savestats[win[1]-1]==0 && savestats[win[0]-1] == what && savestats[win[2]-1] == what){
        return win[1]-1
        }
    if (savestats[win[2]-1]==0 && savestats[win[0]-1] == what && savestats[win[1]-1] == what){
        return win[2]-1
        }
    
    
    }
        return -1

    }
    
        
    


func reset() {
    savestats = [0,0,0,0,0,0,0,0,0];

    }
    
    
}
