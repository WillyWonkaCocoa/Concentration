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
    private(set) var cards = [Card]()
    
    // Computed Variables
    private var indexOfTheOneAndOnlyFaceUpCard: Int? {
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
    
    
    func chooseCard(at index: Int) {
        assert(cards.indices.contains(index), "Concentration.chooseCard(at: \(index)): chosen index not in the cards")
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
        assert(numberOfPairsOfCards > 0, "Concentration.inti(\(numberOfPairsOfCards)): you must have at least one pair of cards")
        // _ means ignore this name/var
        for _ in 1...numberOfPairsOfCards {
            let card = Card()
            cards += [card, card]
        }
        
        // TODO: Shuffle the cards
    }
}
