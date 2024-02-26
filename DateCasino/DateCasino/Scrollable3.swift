//
//  Scrollable.swift
//  DateCasino
//
//  Created by Giuseppe Olivari on 21/02/24.
//

import SwiftUI

struct Scrollable3: View {
    
    @Binding var finalText3: String
    @State private var scrollText = false
    @State private var boh = 0
    @State private var touch3 = false
    @Binding  var blockSpinn3 : Bool
    @Binding var spinn3 : Bool
   
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
                            
                            
                            .onChange(of: spinn3) { newValue in
                                            
                                            if newValue {
                                                
                                                    if !blockSpinn3 {
                                                        blockSpinn3.toggle()
                                                        print("\(blockSpinn3)")
                                                        animateWithTimer(proxy: scrollView, boh: self.boh,touch: self.touch3)
                                                        
                                                        self.spinn3.toggle()
                                                        
                                                    
                                                    }
                                            }
                                        }
                            
                            
                        }
                        Button("Block"){
                            blockSpinn3.toggle()
                        }
                        Text(finalText3)
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
                finalText3 = attr1[arr1[counter]]
                self.boh = counter
                
                
             
            }
            if counter < random {
                counter+=1
                
            }else{
                
                DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(4), execute: {
                    timer.invalidate()
                 
                    //self.spinn1.toggle()
                })
                
                blockSpinn3.toggle()
                print("\(blockSpinn3)")
                
            }
        }
        timer.fire()
      
    }
    
    
    
    
            }
                    #Preview {
                        Scrollable3(finalText3: .constant("c"),blockSpinn3: .constant(false), spinn3: .constant(false))
                    }
                
