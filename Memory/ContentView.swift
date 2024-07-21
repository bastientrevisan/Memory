//
//  ContentView.swift
//  Memory
//
//  Created by Bastien Trevisan on 20/07/2024.
//

import SwiftUI

struct ContentView: View {

    var body: some View {
        Grid(horizontalSpacing: 10, verticalSpacing: 10) {
            GridRow {
                CardView()
                CardView()
                CardView()
                CardView(isFolded: false)
            }
            GridRow {
                CardView()
                CardView(isFolded: false)
                CardView()
                CardView()
            }
            GridRow {
                CardView(isFolded: false)
                CardView()
                CardView()
                CardView()
            }
            GridRow {
                CardView(isFolded: false)
                CardView()
                CardView()
                CardView()
            }
        }
        .foregroundColor(.orange)
        .padding()
    }
}

struct CardView: View {
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
                Text("🏎️").font(.largeTitle)
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
