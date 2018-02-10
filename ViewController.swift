//
//  ViewController.swift
//  TicTacToe
//
//  Created by admin on 30.04.17.
//  Copyright © 2017 s65229. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var reihe: UILabel!
    
    @IBOutlet weak var counterO: UILabel!
    var countO = 0
    var countX = 0
    @IBOutlet weak var counterX: UILabel!
    let brain = TTTBrain();
    var notFinished = true;
    var playerX = true //if true set X, if false set O
    var computer = false
    @IBOutlet weak var oneMoreTime: UIButton!
    
    @IBOutlet weak var comp: UIButton!
    @IBOutlet weak var result: UILabel!
    
    
    @IBAction func pressComp(_ sender: Any) {
        computer = true
        comp.isHidden=true
    }
    
    
    @IBAction func setOorX(_ sender: UIButton) {
        if (comp.isHidden==false){
        comp.isHidden=true
        }

        
        if  (notFinished && sender.title(for: UIControlState.normal) == nil)
        {
            if (playerX){
                sender.setTitle("X", for: UIControlState.normal)
                
                reihe.text = "O"
                brain.save(sender.tag-1, 1)
                checkWin()
                if (computer && notFinished){
                    playerX = !(playerX)
                    
              let position = brain.computerPlay()
                    if (position != -1) {
                let button = self.view.viewWithTag(position+1) as! UIButton
                    button.setTitle("O", for: UIControlState.normal)
                    reihe.text="X"
                    brain.save(position,2)
                    }
                    checkWin()
                }
           
            }
            else 
            {
                sender.setTitle("O", for: UIControlState.normal)
                reihe.text = "X"
                brain.save(sender.tag-1, 2)
                checkWin()
            }
                playerX = !(playerX)
        
        

        
                    
        
        
        }
        
        
        
    }
    
    func checkWin(){
    
    switch (brain.checkWin()){
    case 1: oneMoreTime.isHidden=false
    result.isHidden=false;
    result.text="X hat gewonnen"
    countX += 1
    notFinished = false
    counterX.text = countX.description
    
    case 2: oneMoreTime.isHidden=false
    result.isHidden=false;
    result.text="O hat gewonnen"
    countO += 1
    notFinished = false
    counterO.text = countO.description
    case 3: oneMoreTime.isHidden=false
    result.isHidden=false;
    result.text="Unentschieden"
    notFinished = false
    default: ()
    }
    }
    
    
    @IBAction func reset(_ sender: Any) {
        brain.reset()
        result.isHidden=true;
        oneMoreTime.isHidden=true;
        notFinished = true;
        
        for v in 1...9 {
        let button = self.view.viewWithTag(v) as! UIButton
            button.setTitle(nil, for: UIControlState.normal)
            
            
        }
        
        if (computer && !(playerX)){
            let position = brain.computerPlay()
            if (position != -1) {
                let button = self.view.viewWithTag(position+1) as! UIButton
                button.setTitle("O", for: UIControlState.normal)
                brain.save(position,2)
                reihe.text="X"
                playerX = !(playerX)
                
            }
            
            
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

