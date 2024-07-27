//
//  EmojiMemoryGameView.swift
//  Memory
//
//  Created by Bastien Trevisan on 20/07/2024.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    // ObservedObject Si un champ Published de cet objet change alors la vue est rechargee
    @ObservedObject var viewModel: EmojiMemoryGame
    
    var body: some View {
        VStack {
            ScrollView {
                cards
                    .animation(.default, value: viewModel.cards)
            }
            Button("Shuffle") {
                viewModel.shuffle()
            }
        }
    }
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 85), spacing: 0)], spacing: 0)
        {
            ForEach(viewModel.cards) { card in
                CardView(card)
                    .aspectRatio(2/3, contentMode: .fit)
                    .padding(4)
                    .onTapGesture {
                        viewModel.choose(card)
                    }
            }
        }
        .foregroundColor(.orange)
        .padding()
    }
}

struct CardView: View {
    let card: MemoryGame<String>.Card
    
    init(_ card: MemoryGame<String>.Card) {
        self.card = card
    }
    
    var body: some View {
        ZStack {
            let baseShape = RoundedRectangle(cornerRadius: 12)
            
            Group {
                baseShape.fill(.white)
                baseShape.strokeBorder(lineWidth: 2)
                Text(card.content)
                    .font(.system(size: 200))
                    .minimumScaleFactor(0.01)
                    .aspectRatio(1, contentMode: .fit)
            }
                .opacity(card.isFaceUp ? 1 : 0)
            baseShape.fill()
                .opacity(card.isFaceUp ? 0 : 1)
        }
    }
}

#Preview {
    EmojiMemoryGameView(viewModel: EmojiMemoryGame())
}
