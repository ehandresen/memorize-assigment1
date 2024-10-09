//
//  ContentView.swift
//  Memorize-A1
//
//  Created by Eirik Andresen on 09/10/2024.
//

import SwiftUI

struct ContentView: View {
    let emojis = ["💪", "🏋️‍♂️", "🤸‍♂️", "🏃‍♀️", "🚴‍♀️", "🏊‍♂️"]
    @State var count = 4
    
    var body: some View {
        VStack {
            cards
            buttonAdjusters
        }
        .padding()
    }
    
    var cards: some View {
        ForEach(0..<count, id: \.self) { index in
            CardView(emoji: emojis[index])
        }
    }
    
    var buttonAdjusters: some View {
        HStack {
            Button(action: {
                if count > 1 {
                    count -= 1
                }
            }, label: {
                Image(systemName: "rectangle.stack.badge.minus")
            })
            Spacer()
            Button(action: {
                if count < emojis.count {
                    count += 1
                }
            }, label: {
                Image(systemName: "rectangle.stack.badge.plus")
            })
        }
        .padding()
        .font(.largeTitle)
    }
}

struct CardView: View {
    
    var emoji: String = ""
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10, style: .circular)
                .fill(.red)
            Text(emoji)
                .font(.largeTitle)
        }
    }
}

#Preview {
    ContentView()
}
