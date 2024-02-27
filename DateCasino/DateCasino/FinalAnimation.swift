//
//  FinalAnimation.swift
//  DateCasino
//
//  Created by Giuseppe Olivari on 23/02/24.
//

import SwiftUI

struct FinalAnimation: View {
    
    @Binding  var isPresented : Bool
    @Binding var finalText0: String
    @Binding var finalText2: String
    @Binding var finalText3: String
    
    var body: some View {
        VStack{
            Spacer()
            Image("WIN ANIMATION")
                .resizable()
                .aspectRatio(contentMode: .fit)
            Spacer()
            HStack {
                Text("\(finalText0)").font(.title).background(Color.red)
                Text("\(finalText2)").font(.title).background(Color.red)
                Text("\(finalText3)").font(.title).background(Color.red)
            }
            
            
            
            
        }
    }
}

#Preview {
    FinalAnimation(isPresented: .constant(false), finalText0: .constant("not get"), finalText2: .constant("not get"), finalText3: .constant("not get"))
}
