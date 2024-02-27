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
    var body: some View {
        
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

#Preview {
    GetFinalView(isPresented: .constant(false))
}
