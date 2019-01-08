//
//  ViewController.swift
//  TicTacToe
//
//  Created by Zach Rowley  on 11/13/18.
//  Copyright © 2018 Zach Rowley . All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var gridLabel0: GridLabel!
    @IBOutlet weak var gridLabel1: GridLabel!
    @IBOutlet weak var gridLabel2: GridLabel!
    @IBOutlet weak var gridLabel3: GridLabel!
    @IBOutlet weak var gridLabel4: GridLabel!
    @IBOutlet weak var girdLabel5: GridLabel!
    @IBOutlet weak var gridLabel6: GridLabel!
    @IBOutlet weak var gridLabel7: GridLabel!
    @IBOutlet weak var gridLabel8: GridLabel!
    
    
    var labelsArray = [GridLabel]()
    var xTurn = true
    var gameOver = false
    var catsGame = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        labelsArray.append(gridLabel0)
        labelsArray.append(gridLabel1)
        labelsArray.append(gridLabel2)
        labelsArray.append(gridLabel3)
        labelsArray.append(gridLabel4)
        labelsArray.append(girdLabel5)
        labelsArray.append(gridLabel6)
        labelsArray.append(gridLabel7)
        labelsArray.append(gridLabel8)
        
        
    }
    
    func displayWinningMessage(message: String){
        let alert = UIAlertController(title: message, message: nil, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "Reset", style: .default) {
            (action) in
            self.resetGame()
        }
        alert.addAction(alertAction)
        present(alert, animated: true, completion: nil)
        gameOver = true
    }
    
    func checkForWinner(){
        if gridLabel0.text != "" &&
            gridLabel0.text == gridLabel1.text &&
            gridLabel1.text == gridLabel2.text {
            displayWinningMessage(message: gridLabel0.text! + " Won the Game!!")
        }
            
        else   if gridLabel3.text != "" &&
            gridLabel3.text == gridLabel4.text &&
            gridLabel4.text == girdLabel5.text {
            displayWinningMessage(message: gridLabel3.text! + " Won the Game!!")
        }
            
        else    if gridLabel6.text != "" &&
            gridLabel6.text == gridLabel7.text &&
            gridLabel7.text == gridLabel8.text {
            displayWinningMessage(message: gridLabel6.text! + " Won the Game!!")
        }
            
            
        else    if gridLabel0.text != "" &&
            gridLabel0.text == gridLabel4.text &&
            gridLabel4.text == gridLabel8.text {
            displayWinningMessage(message: gridLabel0.text! + " Won the Game!!")
        }
            
        else    if gridLabel2.text != "" &&
            gridLabel2.text == gridLabel4.text &&
            gridLabel4.text == gridLabel6.text {
            displayWinningMessage(message: gridLabel2.text! + " Won the Game!!")
        }
        else     if gridLabel0.text != "" &&
            gridLabel0.text == gridLabel3.text &&
            gridLabel3.text == gridLabel6.text {
            displayWinningMessage(message: gridLabel0.text! + " Won  the Game!!")
        }
        else    if gridLabel1.text != "" &&
            gridLabel1.text == gridLabel4.text &&
            gridLabel4.text == gridLabel7.text {
            displayWinningMessage(message: gridLabel1.text! + " Won the Game!!")
        }
        else     if gridLabel2.text != "" &&
            gridLabel2.text == girdLabel5.text &&
            girdLabel5.text == gridLabel8.text {
            displayWinningMessage(message: gridLabel2.text! + " Won the Game!!")
        }
        else {
            for labels in labelsArray {
                catsGame = true
                if labels.canTap == true {
                    catsGame = false
                    return
                }
            }
        }
        
    }
    
    func resetGame () {
        for label in labelsArray {
            label.text = ""
            label.canTap = true
            
        }
        xTurn = true
        gameOver = false
    }
    
    
    @IBAction func onTappedGripLabel(_ sender: UITapGestureRecognizer)
    {
        if !gameOver
        {
            for label in labelsArray{
                
                if label.frame.contains(sender.location(in: backgroundView)){
                    
                    if label.canTap
                    {
                        catsGame = false
                        if xTurn
                        {
                            label.text = "X"
                 
                        }
                        else
                        {
                            label.text = "O"
                        }
                        xTurn = !xTurn
                        label.canTap = false
                        checkForWinner()
                    }
                }
            }
            if catsGame {
                displayWinningMessage(message: "Cats Game")
            }
        }
    }
}


