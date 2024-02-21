//
//  ScrollableView.swift
//  DateCasino Watch App
//
//  Created by Giuseppe Olivari on 19/02/24.
//

import SwiftUI

struct ScrollableView1: View {
    
    @State private var finalText1 = "Not get"
    @State private var scrollText = false
    @State private var boh = 0
    @State private var touch = true
    var attr : [String] = ["primo", "secondo", "terzo","quarto","quinto","sesto"]
    let arr = (0..<1000000).map( {_ in Int.random(in: 0...5)} )
    var body: some View {
        
        
        
       
            ScrollViewReader { scrollView in
                ScrollView(showsIndicators: false){
                    LazyVStack(){
                        ForEach(0..<1000000) { index in
                            
                            Text(attr[arr[index]])
                                .font(.title2)
                                .id(index)
                            
                            
                        }
                    }
                }
                .foregroundColor(.green)
                .scrollDisabled(true)
                .frame(height: 130)
                
                
                
                .onTapGesture {
                    if touch {
                        animateWithTimer(proxy: scrollView, boh: self.boh,touch: self.touch)
                        touch.toggle()
                    }
                    else {
                    
                    }
                    
               
                }
                
            }
        //.focusBorderColor(color: .red)
        .foregroundColor(.green)
        Text(finalText1)
        
    }
    
    func animateWithTimer(proxy: ScrollViewProxy, boh: Int, touch : Bool) {
        let count: Int = 10
        let duration: Double = 1.0
        let timeInterval: Double = (duration / Double(count))
        var counter = self.boh
        
//        print("\(counter)")
        let random = Int.random(in:(counter + 50)...(counter+100))
//        let random = Int.random(in: 0...50)
        let timer = Timer.scheduledTimer(withTimeInterval: timeInterval, repeats: true) { (timer) in
            withAnimation(.default) {
                
                proxy.scrollTo(counter, anchor: .center)
                
                //print("fin:\(fin)")
                finalText1 = attr[arr[counter]]
                self.boh = counter
                
                
                WKInterfaceDevice.current().play(.click)
            }
            if counter < random {
                counter+=1
                
            }else{
                
                DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(4), execute: {
                    timer.invalidate()
                    self.touch.toggle()
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

