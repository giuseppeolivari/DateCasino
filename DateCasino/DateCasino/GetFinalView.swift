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
    @State var start = true
    var body: some View {
        ZStack {
            if isPresented && !start{
                if !spinn1 && !spinn2 && !spinn3 && !start{
                    FinalAnimation(isPresented: $isPresented)
                        .position(x: 193, y: 100)
                        .onAppear() {
                            Timer.scheduledTimer(withTimeInterval: 5, repeats: false) { timer in
                                withAnimation(.easeOut(duration: 2)){
                                    self.isPresented.toggle()
                                }
                            }
                        }.transition(.scale)
                }
            }
            VStack {
                if start && !spinn1 && !spinn2 && !spinn3 {
                    Image("grayButton")
                        .resizable()
                        .frame(width: 170, height: 50)
                }else{
                    Button(action: {
                        if !antiSpam && !start && !spinn1 && !spinn2 && !spinn3{
                            antiSpam = true
                            DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                                antiSpam = false
                                start = true
                            }
                            finalView = true
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) { finalView = false }
                            withAnimation(.easeIn(duration: 1)){
                                isPresented.toggle()
                            }
                        }
                    }, label: {
                        if start && !spinn1 && !spinn2 && !spinn3 {
                            Image("grayButton")
                                .resizable()
                                .frame(width: 170, height: 50)
                        } else if !finalView {
                            if !spinn1 && !spinn2 && !spinn3 {
                                Image("Buttonoff")
                                    .resizable()
                                    .frame(width: 170, height: 50)
                            } else {
                                Image("grayButton")
                                    .resizable()
                                    .frame(width: 170, height: 50)
                            }
                        } else {
                            Image("pressedbutton")
                                .resizable()
                                .frame(width: 170, height: 30)
                        }
                    })
                    .onAppear(perform: {
                        start = false
                    })
                }
            }
        }
    }
}

#Preview {
    GetFinalView(isPresented: .constant(false), spinn1: .constant(false), spinn2: .constant(false), spinn3: .constant(false))
}
