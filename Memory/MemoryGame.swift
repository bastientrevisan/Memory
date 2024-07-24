//
//  MemorizeGame.swift
//  Memory
//
//  Created by Bastien Trevisan on 24/07/2024.
//

import Foundation

struct MemoryGame <CardContent> {
    private(set) var cards: Array<Card>
    
    /* Puisqu'on ne sait pas quel est le type des cartes (determiné par le viewModel,
     * On prend en parametre une fonction de ce viewModel qu'on appellera pour creer nos paires de cartes */
    init (numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent ) {
        cards = []
        
        for pairIndex in 0..<max(2, numberOfPairsOfCards) { // Minimun 2 paires de cartes 
            // On cree un cardContent
            let content = cardContentFactory(pairIndex)
            // On cree 2 cartes identiques
            cards.append(Card(content: content))
            cards.append(Card(content: content))
        }
    }
    func choose(_ card: Card) {
        
    }
    
    /* Le model doit avoir le droit de melanger les cartes : Explicit mutating */
    mutating func shuffle() {
        cards.shuffle()
    }
    
    struct Card {
        var isFaceUp    = true
        var isMatched   = false
        let content : CardContent
    }
}
