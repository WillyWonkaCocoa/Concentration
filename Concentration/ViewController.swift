//
//  ViewController.swift
//  Concentration
//
//  Created by William Gao on 4/17/18.
//  Copyright © 2018 William Gao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //methods and instance variables
    
    //method called when dog button is pressed
    @IBAction func touchCard(_ sender: UIButton) {
        flipCard(withEmoji: "🐶", on: sender)
    }
    @IBAction func touchSecondCard(_ sender: UIButton) {
        flipCard(withEmoji: "🙊", on: sender)
    }
    
    func flipCard(withEmoji emoji: String, on button: UIButton){
        print("flipCard(withEmoji: \(emoji))");
        if button.currentTitle == emoji {
            button.setTitle("", for: UIControlState.normal)
            button.backgroundColor = #colorLiteral(red: 0.9220425086, green: 0.3960026836, blue: 1, alpha: 1);
        }else{
            button.setTitle(emoji, for: UIControlState.normal)
            button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1);
        }
    }
}

