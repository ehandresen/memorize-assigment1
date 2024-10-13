//
//  ContentView.swift
//  Memorize-A1
//
//  Created by Eirik Andresen on 09/10/2024.
//

import SwiftUI

struct ContentView: View {
    let emojis = ["💪", "🏋️‍♂️", "🤸‍♂️", "🏃‍♀️", "🚴‍♀️", "🏊‍♂️", "💪", "🏋️‍♂️", "🤸‍♂️", "🏃‍♀️", "🚴‍♀️", "🏊‍♂️"]
    let natureEmojis = ["🌳", "🌸", "🌞", "⛰️", "🌊", "🌈", "🌲", "🍂", "🌻", "🌵", "🌧️", "🌺"]
    let foodEmojis = ["🍕", "🍔", "🍎", "🍓", "🍣", "🍩", "🍰", "🍌", "🍫", "🍇", "🍹", "🍿"]
    
    @State var count = 4
    
    var body: some View {
        VStack {
            title
            ScrollView {
                cards
            }
            Spacer()
            themeButtons
            buttonAdjusters
        }
        .padding()
    }
    
    var title: some View {
        Text("Memorize")
            .font(.largeTitle)
            .fontWeight(.heavy)
    }
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 150))]) {
            ForEach(0..<count, id: \.self) { index in
                CardView(emoji: emojis[index])
                    .aspectRatio(2/3, contentMode: .fit)
            }
        }
        .foregroundStyle(.green)
        
    }
    
    func ThemeButton(label: String) -> some View {
        Button(label, action: {
            print(label)
        })
    }
    
    var themeButtons: some View {
        HStack {
            ThemeButton(label: "theme 1")
            Spacer()
            ThemeButton(label: "theme 2")
            Spacer()
            ThemeButton(label: "theme 3")
        }
        
    }
    
    // TODO: clean up code
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

// TODO: make card flippable by pressing on it
struct CardView: View {
    let emoji: String
    @State var isFlipped = false
    
    var body: some View {
        ZStack {
            if isFlipped {
                RoundedRectangle(cornerRadius: 10, style: .circular)
                    .fill(.blue)
                    .strokeBorder(lineWidth: 4)
            } else {
                RoundedRectangle(cornerRadius: 10, style: .circular)
                    .fill(.red)
                    .strokeBorder(lineWidth: 4)
                Text(emoji)
                    .font(.largeTitle)
            }
            
        }
        .onTapGesture {
            isFlipped.toggle()
        }
    }
}

#Preview {
    ContentView()
}
