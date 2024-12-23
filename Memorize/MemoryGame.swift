//
//  MemoryGame.swift
//  Memorize
//
//  Created by Kuanysh Spandiyar on 29 February
//

import Foundation

struct MemoryGame<CardContent> {
    private(set) var cards: Array<Card>
    
    func choose(_ card: Card) {
        
    }
    
    struct Card {
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent
    }
    
    init(numberOfPairsOfCards: Int, createCardContent: (Int) -> CardContent) {
        cards = Array<Card>()
        for pairIndex in 0..<numberOfPairsOfCards {
            var content: CardContent = createCardContent(pairIndex)
            cards.append(Card(content: content))
        }
    }
}
