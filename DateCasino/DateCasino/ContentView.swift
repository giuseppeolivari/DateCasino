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
    @State var finalText0 = "a"
    @State var finalText2 = "b"
    @State var finalText3 = "c"
    @State var isPresented : Bool = false
    @State var animationIsOn = false
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                VStack {
                    Scrollable(finalText0: $finalText0/*, blockSpinn: $blockSpinn*/, spinn1: $spinn1)
                        .background(.black)
                        .position(x: geometry.size.width / 2, y: geometry.size.height / 2.9)
                    Scrollable2(finalText2: $finalText2/*, blockSpinn2: $blockSpinn2*/, spinn2: $spinn2)
                        .background(.black)
                        .position(x: geometry.size.width / 2, y: geometry.size.height / 7)
                    
                    Scrollable3(finalText3: $finalText3/*, blockSpinn3: $blockSpinn3*/, spinn3: $spinn3)
                        .background(.black)
                        .position(x: geometry.size.width / 2, y: geometry.size.height / -17)
                }
                .foregroundColor(.word)
                .background(Image("Background").resizable().aspectRatio(contentMode: .fill).ignoresSafeArea())
                .bold()
                ZStack {
                    InterfaceView(animationIsOn: $animationIsOn)
                    HStack {
                        Spacer()
                        AnimatedLeverView(spinn1: $spinn1, spinn2: $spinn2, spinn3: $spinn3, animationIsOn: $animationIsOn, action: toggleSpins)
                         
                            .position(x: geometry.size.width / 1.16, y: geometry.size.height / 2)
                    }
                    GetFinalView(isPresented: $isPresented, spinn1: $spinn1, spinn2: $spinn2, spinn3: $spinn3, finalText0: $finalText0, finalText2: $finalText2, finalText3: $finalText3)
                        .position(x: geometry.size.width / 2, y: geometry.size.height / 1.38)
                }  
            }
        }
    }
    func toggleSpins() {
        spinn1.toggle()
        spinn2.toggle()
        spinn3.toggle()
    }
}

#Preview {
    ContentView(spinn1: false, spinn2: false, spinn3: false/*, blockSpinn: false, blockSpinn2: false, blockSpinn3: false*/)
}
