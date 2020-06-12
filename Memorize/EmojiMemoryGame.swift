//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Thomas Smith on 2020-05-27.
//  Copyright © 2020 Thomas Smith. All rights reserved.
//

import SwiftUI

class EmojiMemoryGame {
    private var model: MemoryGame<String> = EmojiMemoryGame.createMemroyGame()
    
    static func createMemroyGame() -> MemoryGame<String> {
        let emojis = ["💕", "👻", "😘", "🧞‍♂️", "🦇"].shuffled()
        return MemoryGame<String>(numberOfPairsOfCards: Int.random(in: 2...emojis.count)) { pairIndex in
            return emojis[pairIndex]
        }
    }
    
    // MARK: - Access to the Model
    
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    
    // MARK: - Intent(s)
    
    func choose(card: MemoryGame<String>.Card) {
        model.choose(card: card)
    }
    
}
