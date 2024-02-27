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
                                Scrollable3(finalText3: $finalText3/*, blockSpinn3: $blockSpinn3*/, spinn3: $spinn3)
                            }
                        }
                        ZStack {
                            Image("background")
                                .resizable()
                                .ignoresSafeArea()
                            HStack {
                                Spacer()
                                
                                Button(action: {
                                    //                        toggleSpins()
                                    //                        print("\(spinn1)")
                                }) {
                                    AnimatedLeverView(spinn1: $spinn1, spinn2: $spinn2, spinn3: $spinn3, action: toggleSpins)
                                    
                                }
                                
                            }
                            VStack {
                                Spacer()
                                Spacer()
                                Spacer()
                                Spacer()
                                Spacer()
                                Spacer()
                                Spacer()
                                Spacer()
                                Button(action: {
                                    withAnimation {
                                        isPresented.toggle()
                                        
                                        //                        blockSpinn = true
                                        //                        blockSpinn2 = true
                                        //                        blockSpinn3 = true
                                    }
                                    
                                }, label: {
                                    VStack {
                                        
                                        Image("Buttonoff")
                                            .resizable()
                                            .frame(width: 200, height: 75)
                                        
                                    }
                                    
                                    .accessibilityLabel("tap to get")
                                })
                                .accessibilityRemoveTraits(.isButton)
                                Spacer()
                                Spacer()
                                Spacer()
                            }
                        }
                    }
                }
            }
            
            if isPresented {
                FinalAnimation(isPresented: $isPresented, finalText0: finalText0, finalText2: finalText2, finalText3: finalText3).onAppear {
                    Timer.scheduledTimer(withTimeInterval: 3, repeats: false) { timer in
                        withAnimation(.easeInOut(duration: 1)) {
                            self.isPresented.toggle()
                            spinn1 = false
                            spinn2 = false
                            spinn3 = false
                        }
                        
                    }
                }//.transition(.scale)
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
