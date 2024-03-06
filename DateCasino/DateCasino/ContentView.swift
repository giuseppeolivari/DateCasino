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
    @State var isPresented : Bool = false
    @State var animationIsOn = false
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                VStack {
                    Scrollable(spinn1: $spinn1)
                        .background(.black)
                        .position(x: geometry.size.width / 2, y: geometry.size.height / 2.7)
                    Scrollable2(spinn2: $spinn2)
                        .background(.black)
                        .position(x: geometry.size.width / 2, y: geometry.size.height / 6.2)
                    Scrollable3(spinn3: $spinn3)
                        .background(.black)
                        .position(x: geometry.size.width / 2, y: geometry.size.height / -21)
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
                    GetFinalView(isPresented: $isPresented, spinn1: $spinn1, spinn2: $spinn2, spinn3: $spinn3)
                        .position(x: geometry.size.width / 2, y: geometry.size.height / 1.34)
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
    ContentView(spinn1: false, spinn2: false, spinn3: false)
}
