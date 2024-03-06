//
//  FinalAnimation.swift
//  DateCasino
//
//  Created by Giuseppe Olivari on 23/02/24.
//

import SwiftUI

struct FinalAnimation: View {
    @Binding  var isPresented : Bool
    var body: some View {
        VStack{
            Spacer()
            Image("WIN ANIMATION")
                .resizable()
                .aspectRatio(contentMode: .fit)
            Spacer()
        }
    }
}

#Preview {
    FinalAnimation(isPresented: .constant(false))
}
