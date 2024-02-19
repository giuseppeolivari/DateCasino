//
//  ContentView.swift
//  DateCasino
//
//  Created by Giuseppe Olivari on 19/02/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
                .font(.custom("LasVegas-Jackpot", size: 30))
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
