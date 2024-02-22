//
//  ContentView.swift
//  DateCasino
//
//  Created by Giuseppe Olivari on 19/02/24.
//

import SwiftUI


struct ContentView: View {
    
    @State var spinn1 : Bool = false
    
    var body: some View {
        HStack {
            Scrollable(spinn1: $spinn1)
            Scrollable(spinn1: $spinn1)
            Scrollable(spinn1: $spinn1)
            Button("lever"){
                spinn1.toggle()
                print("\(spinn1)")
            }
        }
        .padding()
        
    }
}

#Preview {
    ContentView(spinn1: false )
}
