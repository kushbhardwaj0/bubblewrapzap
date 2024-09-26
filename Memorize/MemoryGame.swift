//
//  MemoryGame.swift
//  Memorize
//
//  Created by Kush B.  on 3/12/21.
//

import Foundation

struct MemoryGame<CardContent> {
    //creating an array of cards
    var cards: Array<Card>
    //logic of choosing card
    mutating func choose(card: Card) {
        print ("card chosen: \(card)")
        //the bubble-popping logic
        let chosenIndex: Int = self.index(of: card)
        if self.cards[chosenIndex].isFaceUp {
            self.cards[chosenIndex].isFaceUp = !self.cards[chosenIndex].isFaceUp

        }
        else {
            
        }
    }
    //finding the cards id
    func index(of card: Card) -> Int {
        for index in 0..<self.cards.count {
            if self.cards[index].id == card.id {
                return index
            }
        }
        return 0 // TODO: bogus!
    }
    //making the stuff for the terminal
    init (numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = Array<Card>()
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(content: content, id: pairIndex*2))
            cards.append(Card(content: content, id: pairIndex*2+1))
        }
    }
    //details about the cards
    struct Card: Identifiable {
        var isFaceUp: Bool = true
        var isMatched: Bool = false
        var content: CardContent
        var id: Int
    }
}
//1:13:41
