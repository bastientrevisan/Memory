//
//  MemorizeGame.swift
//  Memory
//
//  Created by Bastien Trevisan on 24/07/2024.
//

import Foundation

/* Card Content est un type generique mais qu doit se conformer a Equatable to compare 2 cards */
struct MemoryGame <CardContent> where CardContent: Equatable {
    private(set) var cards: Array<Card>
    
    /* Puisqu'on ne sait pas quel est le type des cartes (determiné par le viewModel,
     * On prend en parametre une fonction de ce viewModel qu'on appellera pour creer nos paires de cartes */
    init (numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent ) {
        cards = []
        
        for pairIndex in 0..<max(2, numberOfPairsOfCards) { // Minimun 2 paires de cartes 
            // On cree un cardContent
            let content = cardContentFactory(pairIndex)
            // On cree 2 cartes identiques
            cards.append(Card(content: content, id: "\(pairIndex + 1)a"))
            cards.append(Card(content: content, id: "\(pairIndex + 1)b"))
        }
    }
    
    /* card est un parametre passe en valeur on on peut pas toggle dessus, il faut toggle sur notre liste de cartes privee */
    mutating func choose(_ card: Card) {
        /* Chercher l'index de la carte passee en parametre */
        let chosenIndex = index(of: card)
        cards[chosenIndex].isFaceUp.toggle()
    }
    
    /* Retrouve l'index d'une carte random */
    func index(of card: Card) -> Int {
        for index in cards.indices {
            if cards[index].id == card.id {
                return index
            }
        }
        return 0 // FIXME : retourne la premiere carte si non trouve
    }
    
    /* Le model doit avoir le droit de melanger les cartes : Explicit mutating */
    mutating func shuffle() {
        cards.shuffle()
    }
    
    struct Card: Equatable, Identifiable, CustomDebugStringConvertible {
        var debugDescription: String {
            return "\(id): \(content) \(isFaceUp ? "up" : "down") \(isMatched ? "matched" : "")"
        }
        

        
        var isFaceUp    = true
        var isMatched   = false
        let content : CardContent
        
        var id: String
    }
}
