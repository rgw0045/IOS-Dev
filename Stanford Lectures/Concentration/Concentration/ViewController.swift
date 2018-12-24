//
//  ViewController.swift
//  Concentration
//
//  Created by Ricardo Wiggins on 1/21/18.
//  Copyright © 2018 Ricardo Wiggins. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var game = Concentration(numberOfPairsOfCards: (cardButtons.count + 1) / 2)
    var flipCount = 0 {
        didSet{
            flipCountLabel.text = "Flips: \(flipCount)"
        }
    }
    
    @IBOutlet var cardButtons: [UIButton]!
    
    @IBOutlet weak var flipCountLabel: UILabel!
    
    var emojiChoices = ["🦇", "🎃", "👻", "😱", "😈", "🙀", "🍭", "🍬", "🍎"]
    var emoji = [Int:String]()
    
    @IBAction func TouchCard(_ sender: UIButton) {
        flipCount += 1
        if let cardNumber = cardButtons.index(of: sender) {
            game.ChooseCard(at: cardNumber)
            UpdateViewFromModel()
        }
        
    }
    @IBAction func StartNewGame(_ sender: UIButton) {
        game = Concentration(numberOfPairsOfCards: (cardButtons.count + 1) / 2)
    }
    
    func UpdateViewFromModel() {
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.Cards[index]
            if card.isFaceUp {
                button.setTitle(emoji(for: card), for: UIControlState.normal)
                button.backgroundColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)
            } else {
                button.setTitle("", for: UIControlState.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 0.5781051517, blue: 0, alpha: 0) : #colorLiteral(red: 1, green: 0.5781051517, blue: 0, alpha: 1)
            }
        }
    }
    
    func emoji(for card: Card) -> String {
        //build dictionary on demand
        if emoji[card.identifier] == nil, emojiChoices.count > 0 {
            let randomIndex = Int(arc4random_uniform(UInt32(emojiChoices.count)))
            emoji[card.identifier] = emojiChoices.remove(at: randomIndex)
        }
        
        //IF emoji[card.identifier] == nil then return "?"
        return emoji[card.identifier] ?? "?"
    }
    
    
}

