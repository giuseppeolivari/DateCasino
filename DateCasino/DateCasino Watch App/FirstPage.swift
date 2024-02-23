//
//  ContentView.swift
//  DateCasino Watch App
//
//  Created by Giuseppe Olivari on 19/02/24.
//


import Foundation
import SwiftUI

struct FirstPage: View {
    @State private var test = false
    @State private var scrollAmount = 0.0
    
       var body: some View {
           
           
       
               VStack{
                   ScrollableView1(test: $test)
                   
                   
               }.foregroundStyle(.green)
//                   .font(.custom("LasVegas-Jackpot", size: 30))
                   
                   .focusable(true)
                   .digitalCrownRotation($scrollAmount, from: -1, through: 0, by: 1, sensitivity: .low, isContinuous: false, isHapticFeedbackEnabled: true)
                   .scrollIndicators(.hidden)
               
                   .onChange(of: scrollAmount){
                       if(scrollAmount == -1){
                           test.toggle()
                       }
                   }
                   
                   
               
           
           
           
           
         
                  
               
               
           
       }
       
      
   
    
    
}
#Preview {
    FirstPage()
}
