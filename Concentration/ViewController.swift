//
//  ViewController.swift
//  Concentration
//
//  Created by William Gao on 4/17/18.
//  Copyright © 2018 William Gao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //lazy means it doesn't fully initialize until someone trys to use it
    //counts as initialized , cannot have a didSet{} (property observers)
    private lazy var game = Concentration(numberOfPairsOfCards: numberOfPairsOfCards)
    
    // Computed Variable
    var numberOfPairsOfCards: Int {
        return (cardButtons.count + 1) / 2
    }
    
    //methods and instance variables
    private(set) var flipCount = 0 {
        didSet {
            // property observer, executes every time flipCount is set
            flipCountLabel.text = "Flips: \(flipCount)"
        }
    }
    
    @IBOutlet private weak var flipCountLabel: UILabel!
    
    @IBOutlet private var cardButtons: [UIButton]!
    
    //method called when button is pressed
    @IBAction private func touchCard(_ sender: UIButton) {
        flipCount += 1
        // if : only executes if non-nil
        if let cardNumber = cardButtons.index(of: sender){
            game.chooseCard(at: cardNumber)
            //game changes - so view has to update to model
            updateViewFromModel()
        } else{
                print("chosen card was not in cardButtons")
        }
    }
    
    private func updateViewFromModel() {
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp {
                button.setTitle(emoji(for: card), for: UIControlState.normal)
                button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1);
            }else{
                button.setTitle("", for: UIControlState.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0) : #colorLiteral(red: 0.9220425086, green: 0.3960026836, blue: 1, alpha: 1)
            }
        }
    }
    
    private var emojiChoices = ["🙊","🐶","🦁","🐰","🐔","🐼","🦊","🐸"]
    private var emoji = [Int:String]()
    
    private func emoji(for card: Card) -> String {
        if emoji[card.identifier] == nil, emojiChoices.count > 0 {
                emoji[card.identifier] = emojiChoices.remove(at: emojiChoices.count.arc4random)
        }

        //same as above, different syntax
        return emoji[card.identifier] ?? "?"
    }
}


extension Int {
    var arc4random: Int {
        if self > 0 {
            return Int(arc4random_uniform(UInt32(self)))
        } else if self < 0 {
            return -Int(arc4random_uniform(UInt32(abs(self))))
        } else {
            return 0
        }
    }
}
 
