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
    
    
    //@State  var blockSpinn = false
    //@State  var blockSpinn2 = false
    // @State  var blockSpinn3 = false
    
    var body: some View {
        
        ZStack{
            //            Image("background")
            //                .resizable()
            //
            //                .ignoresSafeArea()
            VStack{
                HStack{
                    ZStack {
                        Group {
                            VStack {
                                Scrollable(finalText0: $finalText0/*, blockSpinn: $blockSpinn*/, spinn1: $spinn1)
                                Scrollable2(finalText2: $finalText2/*, blockSpinn2: $blockSpinn2*/, spinn2: $spinn2)
                                    .padding(.top)
                                Scrollable3(finalText3: $finalText3/*, blockSpinn3: $blockSpinn3*/, spinn3: $spinn3)
                                    .padding(.top)
                            }
                            .frame(width: 250, height: 350, alignment: .top)
                            
                        }
                        ZStack {
                            Image("background")
                                .resizable()
                                .ignoresSafeArea()
                            HStack {
                                Spacer()
                                
                                Button(action: { }) {
                                    AnimatedLeverView(spinn1: $spinn1, spinn2: $spinn2, spinn3: $spinn3, action: toggleSpins)
                                    
                                }
                                
                            }
                            Button(action: {
                               
                            }) {
                                GetFinalView(isPresented: $isPresented)
                                
                            }
                        }
                    }
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
