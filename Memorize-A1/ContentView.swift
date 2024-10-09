//
//  ContentView.swift
//  Memorize-A1
//
//  Created by Eirik Andresen on 09/10/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10, style: .circular)
                .fill(.red)
            Text("🏋️‍♀️")
                .font(.largeTitle)
        }
    }
}

#Preview {
    ContentView()
}
