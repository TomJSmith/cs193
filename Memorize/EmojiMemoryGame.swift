//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Thomas Smith on 2020-05-27.
//  Copyright © 2020 Thomas Smith. All rights reserved.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    @Published private var model: MemoryGame<String> = EmojiMemoryGame.createMemroyGame()
    
    
    static func createMemroyGame() -> MemoryGame<String> {
        let themes = [
            MemoryGame<String>.Theme(name: "Halloween", color: Color.orange, contents: ["👻", "🎃", "🦇", "🍬", "🍭", "🕷", "🕸"]),
            MemoryGame<String>.Theme(name: "Christmas", color: Color.blue, contents: ["🎅", "❄️", "☃️", "🎁"]),
            MemoryGame<String>.Theme(name: "Easter", color: Color.pink, contents: ["🐰", "🌷", "🥚", "🍫", "✝️"]),
            MemoryGame<String>.Theme(name: "Thanksgiving", color: Color.yellow, contents: ["🦃", "🌽", "🍗", "🍁"]),
            MemoryGame<String>.Theme(name: "Chinese New Year", color: Color.red, contents: ["🧧", "🧨", "🐉", "🍱", "🎎"]),
            MemoryGame<String>.Theme(name: "Canada Day", color: Color.purple, contents: ["🇨🇦", "🍁", "🎉", "🎆", "🥳"])
        ]

        return MemoryGame<String>(of: themes.randomElement()!)
    }
    
    // MARK: - Access to the Model
    
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    
    var theme: MemoryGame<String>.Theme {
        model.theme
    }
    
    var score: Int {
        model.score
    }
    
    // MARK: - Intent(s)
    
    func choose(card: MemoryGame<String>.Card) {
        model.choose(card: card)
    }
    
    func newGame() {
        model = EmojiMemoryGame.createMemroyGame()
    }
    
}
