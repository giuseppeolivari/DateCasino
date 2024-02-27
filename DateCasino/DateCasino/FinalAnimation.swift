//
//  FinalAnimation.swift
//  DateCasino
//
//  Created by Giuseppe Olivari on 23/02/24.
//

import SwiftUI

struct FinalAnimation: View {
    
    @Binding  var isPresented : Bool
    @State var finalText0: String
    @State var finalText2: String
    @State var finalText3: String
    
    var body: some View {
        VStack{
            
            Image("WIN ANIMATION")
                .resizable()
                .aspectRatio(contentMode: .fit)
            Text("\(finalText0) \(finalText2) \(finalText3)").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            
            
            
            
        }
    }
}

#Preview {
    FinalAnimation(isPresented: .constant(false), finalText0: "a", finalText2: "b", finalText3: "c")
}
