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

    var body: some View {
        
        Grid(horizontalSpacing: 10, verticalSpacing: 10) {
            GridRow {
                ForEach(emojis.indices, id: \.self) { index in
                    CardView(content: emojis[index])
                }
            }
        }
        .foregroundColor(.orange)
        .padding()
    }
}

struct CardView: View {
    let content: String
    @State var isFolded = true
    
    var body: some View {
        ZStack {
            let baseShape = RoundedRectangle(cornerRadius: 12)
            
            if isFolded {
                baseShape.fill()
            }
            else
            {
                baseShape.fill(.white)
                baseShape.strokeBorder(lineWidth: 2)
                Text(content).font(.largeTitle)
            }
        }
        .onTapGesture {
            isFolded.toggle()
        }
    }
}
#Preview {
    ContentView()
}
