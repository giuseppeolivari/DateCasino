//
//  Scrollable.swift
//  DateCasino
//
//  Created by Giuseppe Olivari on 21/02/24.
//

import SwiftUI

struct Scrollable2: View {
    
    @Binding var finalText2: String
    @State private var scrollText = false
    @State private var boh = 0
    @State private var touch = true
    @Binding  var blockSpinn2 : Bool
    @Binding var spinn2 : Bool
   
    var attr1 : [String] = ["first", "second", "third","fourth","fifth","sixth"]

    let arr1 = (0..<1000000).map( {_ in Int.random(in: 0...5)} )
   
    
    
    var body: some View {
        
    
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
                            
                            
                            .onChange(of: spinn2) { newValue in
                                            
                                            if newValue {
                                                
                                                    if !blockSpinn2{
                                                        animateWithTimer(proxy: scrollView, boh: self.boh,touch: self.touch)
                                                        self.spinn2.toggle()
                                                    
                                                    }
                                            }
                                        }
                            
                            
                        }
                        Button("Block"){
                            blockSpinn2.toggle()
                        }
                        Text(finalText2)
                        
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
                finalText2 = attr1[arr1[counter]]
                self.boh = counter
                
                
             
            }
            if counter < random {
                counter+=1
                
            }else{
                
                DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(4), execute: {
                    timer.invalidate()
                    //self.spinn1.toggle()
                })
                
            }
        }
        timer.fire()
      
    }
    
    
    
    
            }
                    #Preview {
                        Scrollable2(finalText2: .constant("b"),blockSpinn2: .constant(false), spinn2: .constant(false))
                    }
                
