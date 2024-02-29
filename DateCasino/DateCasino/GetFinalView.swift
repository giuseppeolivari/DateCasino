//
//  GetFinalView.swift
//  DateCasino
//
//  Created by Dylan Corvo on 27/02/24.
//

import SwiftUI

struct GetFinalView: View {
    @Binding var isPresented: Bool
    @State var antiSpam: Bool = false
    @State var finalView: Bool = false
    @Binding var spinn1: Bool
    @Binding var spinn2: Bool
    @Binding var spinn3: Bool
    @Binding var finalText0: String
    @Binding var finalText2: String
    @Binding var finalText3: String
    var body: some View {
        
        ZStack {
            if isPresented {
                if !spinn1 && !spinn2 && !spinn3 {
                        FinalAnimation(isPresented: $isPresented, finalText0: finalText0, finalText2: finalText2, finalText3: finalText3)
                            .position(x: 193, y: 100)
                            .onAppear() {
                            Timer.scheduledTimer(withTimeInterval: 3, repeats: false) { timer in
                                withAnimation(.easeInOut(duration: 1)) {
                                    self.isPresented.toggle()

                                }
                            }
                            }.transition(.scale)
                        
                            
                    
                }else{
                    
                }
            }
            
            VStack {
                Button(action: {
                    if !antiSpam{
                        antiSpam = true
                        DispatchQueue.main.asyncAfter(deadline: .now() + 5) { antiSpam = false }
                        finalView = true
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) { finalView = false }
                        isPresented.toggle()
                        
                    }
                }, label: {
                    if !finalView {
                        Image("Buttonoff")
                            .resizable()
                            .frame(width: 170, height: 50)
                            
                    } else {
                        Image("pressedbutton")
                            .resizable()
                            .frame(width: 170, height: 30)
                    }
                })
            }
        }
        
        
    }
}

#Preview {
    GetFinalView(isPresented: .constant(false), spinn1: .constant(false), spinn2: .constant(false), spinn3: .constant(false), finalText0: .constant("no get"), finalText2: .constant("no get"), finalText3: .constant("no get"))
}
