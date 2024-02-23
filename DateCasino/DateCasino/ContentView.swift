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
    
    @State  var blockSpinn = false
    @State  var blockSpinn2 = false
    @State  var blockSpinn3 = false
    @State var leverPosition: Int = 0
    let leverPositions = ["lever1", "lever2", "lever3", "lever4", "lever5", "lever6", "lever7", "lever8" ]
    
    var body: some View {
        ZStack{
            VStack{
                HStack {
                    Scrollable(finalText0: $finalText0, blockSpinn: $blockSpinn, spinn1: $spinn1)
                    Scrollable2(finalText2: $finalText2,blockSpinn2: $blockSpinn2, spinn2: $spinn2)
                    Scrollable3(finalText3: $finalText3,blockSpinn3: $blockSpinn3, spinn3: $spinn3)
                    Button(action: {
                        startAnimation()
                        spinn1.toggle()
                        spinn2.toggle()
                        spinn3.toggle()
                        
                        print("\(spinn1)")
                    }) {
                        Image(leverPositions[leverPosition])
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 100, height: 100)
                    }
                    
                }
                .padding()
                
                
                
                Button(action: {
                    withAnimation {
                        isPresented.toggle()
                        
                        blockSpinn = true
                        blockSpinn2 = true
                        blockSpinn3 = true
                    }
                    
                }, label: {
                    VStack {
                        
                        Text("get")
                    }
                    
                    .accessibilityLabel("tap to get")
                })
                .accessibilityRemoveTraits(.isButton)
                
                
                /*
                 COSì APPARE COME MODALE
                 .fullScreenCover(isPresented: $isPresented) {
                 FinalAnimation(isPresented: $isPresented)
                 
                 }
                 */
            }
            
            // COSì APPARE SULLA VIEW
            
            if isPresented {
                FinalAnimation(isPresented: $isPresented, finalText0: finalText0, finalText2: finalText2, finalText3: finalText3).onAppear {
                    Timer.scheduledTimer(withTimeInterval: 3, repeats: false) { timer in
                        withAnimation(.easeInOut(duration: 1)) {
                            self.isPresented.toggle()
                        }
                    }
                }//.transition(.scale)
            }
            
            
            
            
            
            
        }
        
    }
    func startAnimation() {
        var counter = 0
        
        let timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { _ in
            withAnimation {
                leverPosition = counter % leverPositions.count
            }
            counter += 1
        }
        
        // Stop the animation after a certain number of iterations
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            timer.invalidate()
        }
    }
}



#Preview {
    ContentView(spinn1: false, spinn2: false, spinn3: false, blockSpinn: false, blockSpinn2: false, blockSpinn3: false)
}
