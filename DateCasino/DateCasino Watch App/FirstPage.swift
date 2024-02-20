//
//  ContentView.swift
//  DateCasino Watch App
//
//  Created by Giuseppe Olivari on 19/02/24.
//


import Foundation
import SwiftUI

struct FirstPage: View {
    
       var body: some View {
           
           
           NavigationStack{
               VStack{
                   NavigationLink("Prima Categoria",destination: ScrollableView1())
                   NavigationLink("Seconda Categoria",destination: ScrollableView2())
                   NavigationLink("Terza Categoria",destination: ScrollableView3())
                   
               }.foregroundStyle(.green)
//                   .font(.custom("LasVegas-Jackpot", size: 30))
            
                   
                   
               
           }
           
           
           
         
                  
               
               
           
       }
       
      
   
    
    
}
#Preview {
    FirstPage()
}
