//
//  ScrollableView.swift
//  DateCasino Watch App
//
//  Created by Giuseppe Olivari on 19/02/24.
//

import SwiftUI
import WatchKit
import TipKit


struct ScrollableView1: View {
    private let tip = CrownTip()
    @State var backgroundLightLevel: Int = 0
    let backgrounds = ["Light1","Light2"]
    @State private var test = false
    @State private var scrollAmount = 0.0
    @State private var boh = 0
    @State private var cAnimation = 0
    @State var bell = false
    @State var lightCounter = 0
    let light = ["Light1", "Light2"]
    var attr1: [String] = ["Hamburger",
                           "Sushi",
                           "Noodles",
                           "Pizza",
                           "Lasagna",
                           "Steak".localized(),
                           "Roasted chicken".localized(),
                           "Ice cream".localized(),
                           "Kebab",
                           "Pita",
                           "Paella",
                           "Tacos"]

    var attr2 :[String] = ["Cinema",
                                      "Skating".localized(),
                                      "Theater".localized(),
                                      "Paintball",
                                      "Amusement park".localized(),
                                      "Board game".localized(),
                                      "Karaoke",
                                      "Trekking",
                                      "Bowling",
                                      "Baking".localized(),
                                      "Laser tag",
                                      "Escape room"]
    var attr3 : [String] = ["Streaptease".localized(),
                           "Lap dance",
                           "Massage".localized(),
                           "Couple shower".localized(),
                           "Handcuff".localized(),
                           "Role play".localized()]
    let arr = (0..<1000).map( {_ in Int.random(in: 0...5)} )
    var body: some View {
       
        
           
                
            GeometryReader { geometry in
                
                ZStack{
                    
                       
                    Image(light[lightCounter])
                            .position(x: geometry.size.width / 1.06, y: geometry.size.height / 2)
                            .onChange(of: bell) {
                                
                                    if bell{
                                        startAnimation()
                                    }
                                
                            }
                      
                    Image(light[lightCounter])
                            .position(x: geometry.size.width / 14, y: geometry.size.height / 2)
                            .onChange(of: bell) {
                                
                                    if bell{
                                        startAnimation()
                                    }
                                
                            }
                        
                    
                    
                 
                 
                    
                    
                    ScrollViewReader { scrollView in
                        ScrollView(showsIndicators: false){
                            LazyVStack(){
                                Text("FOOD".localized())
                                    .fontWeight(.black)
                                    .foregroundColor(.gia)
                                ForEach(0..<1000) { index in
                                    
                                    Text(attr1[arr[index]])
                                        
                                        .fontWeight(.black)
                                        .id(index)
                                        .foregroundColor(.gia)
                                        .frame(height: 20)
                                                                     
                                    
                                    
                                }
                            }
                        }
                        .scrollDisabled(true)
                        .frame(height: 20)
                        .focusable(true)
                        .digitalCrownRotation($scrollAmount, from: -1, through: 0, by: 1, sensitivity: .low, isContinuous: false, isHapticFeedbackEnabled: true)
                        .scrollIndicators(.hidden)
                    
                        .onChange(of: scrollAmount){
                            if(scrollAmount == -1){
                                animateWithTimer(proxy: scrollView, boh: self.boh)
                                
                            }
                        } .position(x: geometry.size.width / 2, y: geometry.size.height / 7)
                        
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
                                Text("ACTIVITY".localized())
                                    .fontWeight(.black)
                                    .foregroundColor(.gia)
                                ForEach(0..<1000) { index in
                                    
                                    Text(attr2[arr[index]])
                                       
                                        .fontWeight(.black)
                                        
                                        .id(index)
                                        .foregroundColor(.gia)
                                        .frame(height: 25)
                                                                     
                                    
                                    
                                }
                            }
                        }
                        .scrollDisabled(true)
                        .frame(height: 25)
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
                    .position(x: geometry.size.width / 2, y: geometry.size.height / 2)
                    
                    ScrollViewReader { scrollView in
                        ScrollView(showsIndicators: false){
                            LazyVStack(){
                                Text("PLEASURE".localized())
                                    .fontWeight(.black)
                                
                                    .foregroundColor(.gia)
                                ForEach(0..<1000) { index in
                                    
                                    Text(attr3[arr[index]])
                                    
                                        .fontWeight(.black)
                                        .id(index)
                                        .foregroundColor(.gia)
                                        .frame(height: 25)
                                    
                                    
                                }
                            }
                        }
                        .scrollDisabled(true)
                        .frame(height: 25)
                        .focusable(true)
                        .digitalCrownRotation($scrollAmount, from: -1, through: 0, by: 1, sensitivity: .low, isContinuous: false, isHapticFeedbackEnabled: true)
                        .scrollIndicators(.hidden)
                    
                        .onChange(of: scrollAmount){
                            if(scrollAmount == -1){
                                animateWithTimer(proxy: scrollView, boh: self.boh)
                                startAnimation()
                                
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
                
                TipView(tip, arrowEdge: .trailing)
                    .position(x: geometry.size.width / 2, y: geometry.size.height / 11)
                    .foregroundColor(.gia)
                
                
                
                
                
                
                if(cAnimation == 3){
                  
                        Image("WIN ANIMATION")
                        
                            .resizable()
                            .frame(width: geometry.size.width * 1.03   ,height: geometry.size.height / 1.2 )
                            .position(x: geometry.size.width / 2, y: geometry.size.height / 2)
                            .onAppear() {
                                Timer.scheduledTimer(withTimeInterval: 3, repeats: false) { timer in
                                    withAnimation(.easeInOut(duration: 1)) {
                                        cAnimation = 0
                                    }
                                }
                            }
                            .transition(.scale)
                            
                         
                        
                    
                }
                   
                    
               
                
                
            }
        
        
//                   .font(.custom("LasVegas-Jackpot", size: 30))
            
           
            
    }
    func startAnimation() {
        var counter = 1
        let timer = Timer.scheduledTimer(withTimeInterval: 0.3, repeats: true) { _ in
            withAnimation(.none) {
                lightCounter = counter % light.count
            }
            counter += 1
        }
        // Stop the animation after a certain number of iterations
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            timer.invalidate()
            let timer2 = Timer.scheduledTimer(withTimeInterval: 0.3, repeats: true) { _ in
                withAnimation(.none) {
                    lightCounter = counter % light.count
                }
                counter -= 1
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.7) {
                timer2.invalidate()
                bell.toggle()
            }
        }
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
                
                DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(2), execute: {
                    if(cAnimation != 2){
                        cAnimation += 1}
                    else{
                        withAnimation(.easeIn){
                            cAnimation += 1
                        }
                    }
                                })
                
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

