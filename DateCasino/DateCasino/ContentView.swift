//
//  ContentView.swift
//  DateCasino
//
//  Created by Giuseppe Olivari on 19/02/24.
//

import SwiftUI


struct ContentView: View {
    
    @State var spinn1 : Bool = false
    @State var spinn2 : Bool = false
    @State var spinn3 : Bool = false
    var body: some View {
        HStack {
            Scrollable(spinn1: $spinn1)
            Scrollable2(spinn2: $spinn2)
            Scrollable3(spinn3: $spinn3)
            Button("lever"){
                spinn1.toggle()
                spinn2.toggle()
                spinn3.toggle()
                
                print("\(spinn1)")
            }
        }
        .padding()
        
    }
}

#Preview {
    ContentView(spinn1: false, spinn2: false, spinn3: false )
}
