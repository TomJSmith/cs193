//
//  MemoryGame.swift
//  Memorize
//
//  Created by Thomas Smith on 2020-05-27.
//  Copyright © 2020 Thomas Smith. All rights reserved.
//

import Foundation
import SwiftUI

struct MemoryGame<CardContent> where CardContent: Equatable {
    var cards: Array<Card>
    let theme: Theme
    var score: Int = 0
    
    var indexOfTheOneAndOnlyFaceUpCard: Int? {
        get { cards.indices.filter { cards[$0].isFaceUp }.only }
        set {
            for index in cards.indices {
                cards[index].isFaceUp = index == newValue
            }
        }
    }
    
    mutating func choose(card: Card) {
        if let chosenIndex = cards.firstIndex(matching: card), !cards[chosenIndex].isFaceUp {
            if let potentialMatchIndex = indexOfTheOneAndOnlyFaceUpCard {
                if cards[chosenIndex].content == cards[potentialMatchIndex].content {
                    cards[chosenIndex].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                    score += 2
                } else {
                    if cards[chosenIndex].hasBeenShown { score -= 1 }
                    if cards[potentialMatchIndex].hasBeenShown { score -= 1 }
                }
                self.cards[chosenIndex].isFaceUp = true
            } else {
                indexOfTheOneAndOnlyFaceUpCard = chosenIndex
            }
        }
    }
    
    init(of theme: Theme) {
        cards = Array<Card>()
        self.theme = theme
        
        for pairIndex in 0..<theme.numberOfPairsOfCards {
            let content = theme.cardContentFactory(pairIndex);
            cards.append(Card(id: pairIndex * 2, content: content))
            cards.append(Card(id: pairIndex * 2 + 1, content: content))
        }
        cards.shuffle()
    }
    
    struct Card: Identifiable {
        var id: Int
        var content: CardContent
        var isFaceUp: Bool = false {
            didSet {
                if oldValue {
                    hasBeenShown = true
                }
            }
        }
        var isMatched: Bool = false
        var hasBeenShown: Bool = false
    }
    
    struct Theme {
        var name: String
        var color: Color
        var contents: [CardContent]

        var numberOfPairsOfCards: Int {
            get {
                return contents.count
            }
        }
        
        func cardContentFactory(_ index: Int) -> CardContent {
            contents[index]
        }
    }
}
