//
//  FinalAnimation.swift
//  DateCasino
//
//  Created by Giuseppe Olivari on 23/02/24.
//

import SwiftUI

struct FinalAnimation: View {
    
    @Binding  var isPresented : Bool
    var finalText0: String
    var finalText2: String
    var finalText3: String
    
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
    FinalAnimation(isPresented: .constant(false), finalText0: "not get", finalText2: "not get", finalText3: "not get")
}
