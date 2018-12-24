//
//  Concentration.swift
//  Concentration
//
//  Created by Ricardo Wiggins on 3/19/18.
//  Copyright © 2018 Ricardo Wiggins. All rights reserved.
//

import Foundation


class Concentration {
    
    var Cards = [Card]()
    var indexOfOneAndOnlyFaceUpCard: Int?
    
    func ChooseCard(at index: Int) {
        if !Cards[index].isMatched {
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                //check if cards match
                if Cards[matchIndex].identifier == Cards[index].identifier {
                    Cards[matchIndex].isMatched = true
                    Cards[index].isMatched = true
                }
                Cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = nil
            } else {
                //check if no cards or two cards are face up
                for flipDownIndex in Cards.indices {
                    Cards[flipDownIndex].isFaceUp = false
                }
                Cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = index
            }
            
        }
    }
    
    init(numberOfPairsOfCards: Int){
        var tempDeck = [Card]()
        for _ in 0..<numberOfPairsOfCards {
            let card = Card()
            tempDeck += [card, card]
        }
        
        //shuffle the cards
        let counter = tempDeck.count
        
        for _ in 0...counter {
            var tempcard = Card()
            let randomIndex = Int(arc4random_uniform(UInt32(tempDeck.count)))
            tempcard = tempDeck.remove(at: randomIndex)
            Cards += [tempcard]
        }
        
    }
}
