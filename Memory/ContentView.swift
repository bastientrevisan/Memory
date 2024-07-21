//
//  ContentView.swift
//  Memory
//
//  Created by Bastien Trevisan on 20/07/2024.
//

import SwiftUI

struct ContentView: View {
    let emojis = ["🏎️", "🚒", "🚲", "🏍️", "🚜", "🚁", "🛥️", "🚀",
                  "🏎️", "🚒", "🚲", "🏍️", "🚜", "🚁", "🛥️", "🚀"]
    
    @State var cardCount: Int = 4
    
    var body: some View {
        VStack {
            ScrollView {
                cards
            }
            cardCountAdjusters
        }
    }
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(),GridItem(),GridItem(),GridItem()])
        {
            ForEach(0..<cardCount, id: \.self) { index in
                CardView(content: emojis[index])
                    .aspectRatio(2/3, contentMode: .fit)
            }
        }
        .foregroundColor(.orange)
        .padding()
    }
    
    var cardCountAdjusters: some View {
        HStack {
            cardRemover
            Spacer()
            cardAdder
        }
        .imageScale(.large)
        .font(.largeTitle)
        .padding()
    }
    
    func cardCountAdjuster(by offset: Int, symbol: String) -> some View {
        Button(action: {
            cardCount += offset
        }, label: {
            Image(systemName: symbol)
        })
        .disabled(cardCount + offset < 1 || cardCount + offset > emojis.count)
    }
    
    var cardRemover: some View {
        cardCountAdjuster(by: -1, symbol: "rectangle.stack.badge.minus.fill")
    }
    
    var cardAdder: some View {
        cardCountAdjuster(by: +1, symbol: "rectangle.stack.badge.plus.fill")
    }
}

struct CardView: View {
    let content: String
    @State var isFolded = true
    
    var body: some View {
        ZStack {
            let baseShape = RoundedRectangle(cornerRadius: 12)
            
            Group {
                baseShape.fill(.white)
                baseShape.strokeBorder(lineWidth: 2)
                Text(content).font(.largeTitle)
            }
            .opacity(isFolded ? 0 : 1)
            baseShape.fill().opacity(isFolded ? 1 : 0)
        }
        .onTapGesture {
            isFolded.toggle()
        }
    }
}
#Preview {
    ContentView()
}
