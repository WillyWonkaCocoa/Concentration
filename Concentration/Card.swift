//
//  Card.swift
//  Concentration
//
//  Created by William Gao on 5/29/18.
//  Copyright © 2018 William Gao. All rights reserved.
//

import Foundation

struct Card : Hashable
    //gets free initializer that inits all variables
{
    var hashValue: Int { return identifier }
    
    static func ==(lhs: Card, rhs: Card) -> Bool {
        return lhs.identifier == rhs.identifier
    }
    
    var isFaceUp = false
    var isMatched = false
    private var identifier: Int
    //UI indepedent(part of model, not view), no emojis
    
    private static var identifierFactory = 0;
    
    //static function: can't send to class, only send to type itself
    private static func getUniqueIdentifier() -> Int {
        identifierFactory += 1
        return identifierFactory
    }
    
    init() {
        //usually has same internal and external name
        self.identifier = Card.getUniqueIdentifier()
    }
}
