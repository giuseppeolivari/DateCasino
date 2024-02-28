//
//  ScrollableView.swift
//  DateCasino Watch App
//
//  Created by Giuseppe Olivari on 19/02/24.
//

import SwiftUI
import WatchKit



struct ScrollableView1: View {
    @State private var test = false
    @State private var scrollAmount = 0.0
    @State private var finalText1 = "Not get"
    @State private var scrollText = false
    @State private var boh = 0
    var attr1 : [String] = ["Hamburger", "Sushi", "Noodles", "Pizza", "Lasagna", "Steak", "Roasted chicken", "Ice cream", "Kebab", "Pita", "Paella", "Tacos"]
    var attr2 : [String] = ["Cinema",
                            "Skating",
                            "Theater",
                            "Paintball",
                            "Amusement park",
                            "Board game",
                            "Karaoke",
                            "Trekking",
                            "Bowling",
                            "Baking",
                            "Laser tag",
                            "Escape room"]
    var attr3 : [String] = ["Streaptease", "Lap dance", "Massage", "Couple shower", "Handcuff", "Role play"]
    let arr = (0..<1000).map( {_ in Int.random(in: 0...5)} )
    var body: some View {
       
        
           
                
            GeometryReader { geometry in
                
                ZStack{
                   
                    Image("BackgroundWatch")
                        .resizable()
                        .ignoresSafeArea()
                        .frame(width:185,height: 210)
                        .position(x: geometry.size.width / 2, y: geometry.size.height / 2 )
                        .background(.gray)
                 
                    
                    
                    ScrollViewReader { scrollView in
                        ScrollView(showsIndicators: false){
                            LazyVStack(){
                                ForEach(0..<1000) { index in
                                    
                                    Text(attr1[arr[index]])
                                        
                                        .id(index)
                                        .foregroundColor(.black)
                                                                     
                                    
                                    
                                }
                            }
                        }
                        .foregroundColor(.green)
                        .scrollDisabled(true)
                        .frame(height: 20)
                        .focusable(true)
                        .digitalCrownRotation($scrollAmount, from: -1, through: 0, by: 1, sensitivity: .low, isContinuous: false, isHapticFeedbackEnabled: true)
                        .scrollIndicators(.hidden)
                    
                        .onChange(of: scrollAmount){
                            if(scrollAmount == -1){
                                animateWithTimer(proxy: scrollView, boh: self.boh)
                                
                            }
                        } .position(x: geometry.size.width / 2, y: geometry.size.height / 11)
                        
        //                .onChange(of: test){
        //                    newValue in
        //
        //                        animateWithTimer(proxy: scrollView, boh: self.boh)
        //
        //                }
                        
                        
                    }
                    ScrollViewReader { scrollView in
                        ScrollView(showsIndicators: false){
                            LazyVStack(){
                                ForEach(0..<1000) { index in
                                    
                                    Text(attr2[arr[index]])
                                       
                                        .id(index)
                                        .foregroundColor(.black)
                                                                     
                                    
                                    
                                }
                            }
                        }
                        .foregroundColor(.green)
                        .scrollDisabled(true)
                        .frame(height: 20)
                        .focusable(true)
                        .digitalCrownRotation($scrollAmount, from: -1, through: 0, by: 1, sensitivity: .low, isContinuous: false, isHapticFeedbackEnabled: true)
                        .scrollIndicators(.hidden)
                    
                        .onChange(of: scrollAmount){
                            if(scrollAmount == -1){
                                animateWithTimer(proxy: scrollView, boh: self.boh)
                                
                            }
                        }
                        
        //                .onChange(of: test){
        //                    newValue in
        //
        //                        animateWithTimer(proxy: scrollView, boh: self.boh)
        //
        //                }
                        
                        
                    }
                    .position(x: geometry.size.width / 2, y: geometry.size.height / 2.2)
                    
                    ScrollViewReader { scrollView in
                        ScrollView(showsIndicators: false){
                            LazyVStack(){
                                ForEach(0..<1000) { index in
                                    
                                    Text(attr3[arr[index]])
        
                                        .id(index)
                                        .foregroundColor(.black)
                                                                            
                                    
                                }
                            }
                        }
                        .foregroundColor(.green)
                        .scrollDisabled(true)
                        .frame(height: 20)
                        .focusable(true)
                        .digitalCrownRotation($scrollAmount, from: -1, through: 0, by: 1, sensitivity: .low, isContinuous: false, isHapticFeedbackEnabled: true)
                        .scrollIndicators(.hidden)
                    
                        .onChange(of: scrollAmount){
                            if(scrollAmount == -1){
                                animateWithTimer(proxy: scrollView, boh: self.boh)
                                
                            }
                        }
                        
        //                .onChange(of: test){
        //                    newValue in
        //
        //                        animateWithTimer(proxy: scrollView, boh: self.boh)
        //
        //                }
                        
                        
                    } .position(x: geometry.size.width / 2, y: geometry.size.height / 1.18)
                    
                    
                 
                    
                }
                
            }
        
//                   .font(.custom("LasVegas-Jackpot", size: 30))
            
           
            
    }
    func animateWithTimer(proxy: ScrollViewProxy, boh: Int ) {
        let count: Int = 10
        let duration: Double = 1.0
        let timeInterval: Double = (duration / Double(count))
        var counter = self.boh
        
//        print("\(counter)")
        let random = Int.random(in:(counter + 30)...(counter+70))
//        let random = Int.random(in: 0...50)
        let timer = Timer.scheduledTimer(withTimeInterval: timeInterval, repeats: true) { (timer) in
            withAnimation(.default) {
                
                proxy.scrollTo(counter, anchor: .center)
                
                //print("fin:\(fin)")
                
                self.boh = counter
                
                
                WKInterfaceDevice.current().play(.click)
            }
            if counter < random {
                counter+=1
                
            }else{
                
                timer.invalidate()
                
            }
        }
        timer.fire()
      
    }
    
}
//extension Picker {
//func focusBorderColor(color: Color) -> some View {
//    let isWatchOS7: Bool = {
//        if #available(watchOS 7, *) {
//            return true
//        }
//        return false
//    }()
//
//    let padding: EdgeInsets = {
//        if isWatchOS7 {
//            return .init(top: 18, leading: 0, bottom: 0, trailing: 0)
//        }
//        return .init(top: 8.5, leading: 0.5, bottom: 8.5, trailing: 0.5)
//    }()
//
//    return self
//        .overlay(
//            RoundedRectangle(cornerRadius: isWatchOS7 ? 13 : 2)
//                .stroke(color, lineWidth: isWatchOS7 ? 3 : 2.5)
//                .offset(y: isWatchOS7 ? 0 : 8)
//                .padding(padding)
//        )
//  }


#Preview {
    ScrollableView1()
}

