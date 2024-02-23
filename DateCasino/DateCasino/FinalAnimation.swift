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
           
            
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/).font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            
           
            
            
        }.background(Color(.red))
    }
}

#Preview {
    FinalAnimation(isPresented: .constant(false))
}
