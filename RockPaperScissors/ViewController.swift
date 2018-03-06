//
//  ViewController.swift
//  RockPaperScissors
//
//  Created by Linda Chen on 3/5/18.
//  Copyright © 2018 Synestha. All rights reserved.
//  Note: Best viewed on iPhone 8 or X.

import UIKit


class ViewController: UIViewController {
    
    var choice = ""
    var theirChoice = ""
    var outcome = 0
    
    @IBOutlet weak var yourMove: UIImageView!
    @IBOutlet weak var theirMove: UIImageView!
    @IBOutlet weak var message: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        yourMove.isHidden = true
        theirMove.isHidden = true
        message.text = ""
    }

    func findWinner() {
        let random = Int(arc4random_uniform(UInt32(3)))
        switch random {
        case 0:
            theirChoice = "rock"
            print("Opponent chose rock")
        case 1:
            theirChoice = "paper"
            print("Opponent chose paper")
        case 2:
            theirChoice = "scissors"
            print("Opponent chose scissors")
        default:
            theirChoice = ""
        }
        
        if choice == theirChoice {
            outcome = 0
        } else if choice == "rock" {
            if theirChoice == "scissors" {
                outcome = 1
            } else {
                outcome = -1
            }
        } else if choice == "paper" {
            if theirChoice == "rock" {
                outcome = 1
            } else {
                outcome = -1
            }
        } else if choice == "scissors" {
            if theirChoice == "paper" {
                outcome = 1
            } else {
                outcome = -1
            }
        }
        
        updateUI()
    
    }
    
    func updateUI() {
        yourMove.isHidden = false
        theirMove.isHidden = false
        yourMove.image = UIImage(named: choice)
        theirMove.image = UIImage(named: theirChoice)
        
        switch outcome {
        case 0:
            message.text = "It's a draw!"
        case -1:
            message.text = "You lose!"
        case 1:
            message.text = "You win!"
        default:
            message.text = "Error"
        }
    }
    
    @IBAction func rockTapped(_ sender: Any) {
        choice = "rock"
        findWinner()
    }
    
    @IBAction func paperTapped(_ sender: Any) {
        choice = "paper"
        findWinner()
    }
    
    @IBAction func scissorsTapped(_ sender: Any) {
        choice = "scissors"
        findWinner()
    }
    
    
    

}

