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
    var isFolded: Bool = true
    
    var body: some View {
        ZStack {
            if isFolded {
                RoundedRectangle(cornerRadius: 12)
            }
            else
            {
                RoundedRectangle(cornerRadius: 12)
                    .fill(.white)
                RoundedRectangle(cornerRadius: 12)
                    .strokeBorder(lineWidth: 2)
                Text("🏎️").font(.largeTitle)
            }
        }
    }
}
#Preview {
    ContentView()
}
