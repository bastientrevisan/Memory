//
//  EmojiMemoryGame.swift
//  Memory
//
//  Created by Bastien Trevisan on 24/07/2024.
//

import SwiftUI

/* viewModel, l'interface entre notre modele et les vues. Les vues ne doivent pas pouvoir acceder au modele directement */
class EmojiMemoryGame: ObservableObject {
//    En Swift c'est le compilateur qui decide de l'odre d'initialisation des proprietes d'une classe
//    Ici si on ne met pas static, emojis peut etre appelé pour initialiser model alors qu'il ne sera pas initialisé lui meme
//    static permet de dire au compilateur : Fait comme si c'etait une variable globale (donc initialisee en priorite) mais limite la au namespace de la classe
    private static let emojis = ["🏎️", "🚒", "🚲", "🏍️", "🚜", "🚁", "🛥️", "🚀"]
    
    private static func createMemoryGame () -> MemoryGame<String> {
        // Rappel: La closure est la fonction a passer en dernier parametre de MemoryGame init(), "inlinée"
        // En C on aurait créé une fonction qui renvoie un emoji en fonction de l'indice du tableau et on aurait passé un pointeur de fonction
        return MemoryGame(numberOfPairsOfCards: 8) { pairIndex in
            // Verifie que l'index est pas out of bounds 
            if emojis.indices.contains(pairIndex) {
                return emojis[pairIndex]
            } else {
                return "⁉️"
            }
        }
    }
//   Version de la closure non simplifiée par les inférences de type :
//    private var model = MemoryGame(numberOfPairsOfCards: 4, cardContentFactory: { (pairIndex: Int ) -> String in
//        return emojis[pairIndex]
//    }
    
    
    @Published private var model = createMemoryGame()
    
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
    // MARK: - Intents
    
    func shuffle() {
        model.shuffle()
    }
    
    /* Le _ avant le parametre permet de ne pas specifier son nom lors de l'appel */
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
    
     
}
