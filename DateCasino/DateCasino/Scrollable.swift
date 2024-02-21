//
//  Scrollable.swift
//  DateCasino
//
//  Created by Giuseppe Olivari on 21/02/24.
//

import SwiftUI

struct Scrollable: View {
    
    @State private var finalText1 = "Not get"
    @State private var finalText2 = "Not get"
    @State private var finalText3 = "Not get"
    @State private var scrollText = false
    @State private var boh = 0
    @State private var touch1 = true
    @State private var touch2 = true
    @State private var touch3 = true
    var attr1 : [String] = ["first", "second", "third","fourth","fifth","sixth"]
    var attr2 : [String] = ["first", "second", "third","fourth","fifth","sixth"]
    var attr3 : [String] = ["first", "second", "third","fourth","fifth","sixth"]
    let arr1 = (0..<1000000).map( {_ in Int.random(in: 0...5)} )
    let arr2 = (0..<1000000).map( {_ in Int.random(in: 0...5)} )
    let arr3 = (0..<1000000).map( {_ in Int.random(in: 0...5)} )
    
    
    var body: some View {
        
        VStack{
            
            HStack{
                
                Group{
                    VStack{
                        
                    ScrollViewReader { scrollView in
                        ScrollView(showsIndicators: false){
                            LazyVStack(){
                                ForEach(0..<1000000) { index in
                                    
                                    Text(attr1[arr1[index]])
                                        .font(.title2)
                                        .id(index)
                                    
                                    
                                }
                            }
                        }
                        .foregroundColor(.green)
                        .scrollDisabled(true)
                        .frame(height: 130)
                        
                        
                        
                        .onTapGesture {
                            if touch1 {
                                animateWithTimer(proxy: scrollView, boh: self.boh,touch: self.touch1)
                                touch1.toggle()
                            }
                            else {
                                
                            }
                            
                            
                        }
                        
                        
                    }
                    //.focusBorderColor(color: .red)
                    .foregroundColor(.green)
                    
                        
                        
                        Text(finalText1)
                    }
                }

                
                
                
                
                
                Group{
                    VStack{
                        
                    ScrollViewReader { scrollView in
                        ScrollView(showsIndicators: false){
                            LazyVStack(){
                                ForEach(0..<1000000) { index in
                                    
                                    Text(attr2[arr2[index]])
                                        .font(.title2)
                                        .id(index)
                                    
                                    
                                }
                            }
                        }
                        .foregroundColor(.green)
                        .scrollDisabled(true)
                        .frame(height: 130)
                        
                        
                        
                        .onTapGesture {
                            if touch2 {
                                animateWithTimer2(proxy: scrollView, boh: self.boh,touch: self.touch2)
                                touch2.toggle()
                            }
                            else {
                                
                            }
                            
                            
                        }
                        
                        
                    }
                    //.focusBorderColor(color: .red)
                    .foregroundColor(.green)
                    
                        
                        
                        Text(finalText2)
                    }
                }

                
                
                Group{
                    VStack{
                        
                    ScrollViewReader { scrollView in
                        ScrollView(showsIndicators: false){
                            LazyVStack(){
                                ForEach(0..<1000000) { index in
                                    
                                    Text(attr3[arr3[index]])
                                        .font(.title2)
                                        .id(index)
                                    
                                    
                                }
                            }
                        }
                        .foregroundColor(.green)
                        .scrollDisabled(true)
                        .frame(height: 130)
                        
                        
                        
                        .onTapGesture {
                            if touch3 {
                                animateWithTimer3(proxy: scrollView, boh: self.boh,touch: self.touch3)
                                touch3.toggle()
                            }
                            else {
                                
                            }
                            
                            
                        }
                        
                        
                    }
                    //.focusBorderColor(color: .red)
                    .foregroundColor(.green)
                    
                        
                        
                        Text(finalText3)
                    }
                }
                
                //this will be the lever
                Button("lever") {
                    
                }
                
            }
            
            HStack{
                
                Button("Lock") {
                    
                }
                
                
                Button("Lock") {
                    
                }
                
                
                Button("Lock") {
                    
                }
                
            }
            
        }
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
                finalText1 = attr1[arr1[counter]]
                self.boh = counter
                
               
            }
            if counter < random {
                counter+=1
                
            }else{
                
                DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(4), execute: {
                    timer.invalidate()
                    self.touch1.toggle()
                })
                
            }
        }
        timer.fire()
        
    }
    
    func animateWithTimer2(proxy: ScrollViewProxy, boh: Int, touch : Bool) {
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
                finalText2 = attr2[arr2[counter]]
                self.boh = counter
                
               
            }
            if counter < random {
                counter+=1
                
            }else{
                
                DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(4), execute: {
                    timer.invalidate()
                    self.touch2.toggle()
                })
                
            }
        }
        timer.fire()
        
    }
    
    func animateWithTimer3(proxy: ScrollViewProxy, boh: Int, touch : Bool) {
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
                finalText3 = attr3[arr3[counter]]
                self.boh = counter
                
               
            }
            if counter < random {
                counter+=1
                
            }else{
                
                DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(4), execute: {
                    timer.invalidate()
                    self.touch3.toggle()
                })
                
            }
        }
        timer.fire()
        
    }
    
    
    
    
    
}


#Preview {
    Scrollable()
}

