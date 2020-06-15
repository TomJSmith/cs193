//
//  MemoryGame.swift
//  Memorize
//
//  Created by Thomas Smith on 2020-05-27.
//  Copyright © 2020 Thomas Smith. All rights reserved.
//

import Foundation

struct MemoryGame<CardContent> {
    var cards: Array<Card>
    
    mutating func choose(card: Card) {
        print("card chosen: \(card)")
        let chosenIndex = Index(of: card)
        cards[chosenIndex].isFaceUp = !cards[chosenIndex].isFaceUp
    }
    
    func Index(of card: Card) -> Int {
        for index in 0..<cards.count {
            if (cards[index].id == card.id) {
                return index
            }
        }
        return -1 // TODO: need better return
    }
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = Array<Card>()
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = cardContentFactory(pairIndex);
            cards.append(Card(id: pairIndex * 2, content: content))
            cards.append(Card(id: pairIndex * 2 + 1, content: content))
        }
    }
    
    struct Card: Identifiable {
        var id: Int
        var content: CardContent
        var isFaceUp: Bool = true
        var isMatched: Bool = false
    }
}
