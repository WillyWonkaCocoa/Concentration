//
//  Concentration.swift
//  Concentration
//
//  Created by William Gao on 5/29/18.
//  Copyright © 2018 William Gao. All rights reserved.
//

import Foundation

class Concentration
    //no free initializers that init every var
{
    var cards = [Card]()
    
    // Computed Variables
    var indexOfTheOneAndOnlyFaceUpCard: Int? {
        get {
            var foundIndex: Int?
            for index in cards.indices {
                if cards[index].isFaceUp {
                    if foundIndex == nil {
                        foundIndex = index
                    } else {
                        return nil
                    }
                }
            }
            return foundIndex
        }
        
        set {
            for index in cards.indices {
                cards[index].isFaceUp = (index == newValue)
            }
        }
    }
    
    // variable only set in one specific situation
    var indexOfOneAndOnlyFaceUpCard: Int?
    
    func chooseCard(at index: Int) {
        /*
        if cards[index].isFaceUp {
            cards[index].isFaceUp = false;
        }else {
            cards[index].isFaceUp = true;
        }*/
        
        if !cards[index].isMatched {
            if let matchIndex = indexOfTheOneAndOnlyFaceUpCard, matchIndex != index {
                // check if cards match
                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                
                cards[index].isFaceUp = true
            }else{
                // handled in computed variable
//                // either no cards or 2 cards are face up
//                for flipDownIndex in cards.indices {
//                    cards[flipDownIndex].isFaceUp = false
//                }
//                    cards[index].isFaceUp = true
                    indexOfTheOneAndOnlyFaceUpCard = index
        
            }
        }
    }
    
    init(numberOfPairsOfCards: Int){
        // _ means ignore this name/var
        for _ in 1...numberOfPairsOfCards {
            let card = Card()
            cards += [card, card]
        }
        
        // TODO: Shuffle the cards
    }
}
