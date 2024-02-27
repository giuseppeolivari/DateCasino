//
//  GetFinalView.swift
//  DateCasino
//
//  Created by Dylan Corvo on 27/02/24.
//

import SwiftUI

struct GetFinalView: View {
    @Binding var isPresented: Bool
    @State var finalView: Bool = false
    @State var spinn1 : Bool = false
    @State var spinn2 : Bool = false
    @State var spinn3 : Bool = false
    @State var finalText0 = "a"
    @State var finalText2 = "b"
    @State var finalText3 = "c"
    var body: some View {
        
        ZStack {
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
                    
                    finalView = true
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) { finalView = false }
                    isPresented.toggle()
                }, label: {
                    if !finalView {
                        Image("Buttonoff")
                            .resizable()
                            .frame(width: 150, height: 75)
                    } else {
                        Image("pressedbutton")
                            .resizable()
                            .frame(width: 150, height: 60)
                    }
                })
                
                Spacer()
                Spacer()
                Spacer()
            }
        }


    }
}

#Preview {
    GetFinalView(isPresented: .constant(false))
}
