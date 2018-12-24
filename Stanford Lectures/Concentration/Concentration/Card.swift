//
//  Card.swift
//  Concentration
//
//  Created by Ricardo Wiggins on 3/19/18.
//  Copyright © 2018 Ricardo Wiggins. All rights reserved.
//

import Foundation

struct Card {
    var isFaceUp = false
    var isMatched = false
    var identifier: Int
    
    static var IdentifierFactory = 0
    
    static func getUniqueIdentifier() -> Int {
        IdentifierFactory += 1
        return IdentifierFactory
    }
    
    init() {
        self.identifier = Card.getUniqueIdentifier()
        //TODO: Shuffle the cards
        
    }
    
}
