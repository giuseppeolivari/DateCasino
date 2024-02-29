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
    @State private var animationIsOn = false
    //@Binding  var blockSpinn3 : Bool
    @Binding var spinn3 : Bool
    
    var attr1 : [String] = ["Streaptease".localized(),
                            "Lap dance",
                            "Massage".localized(),
                            "Couple shower".localized(),
                            "Handcuff".localized(),
                            "Role play".localized()]
    
    let arr1 = (0..<1000000).map( {_ in Int.random(in: 0...5)} )
    
    
    
    var body: some View {
        
        
        VStack{
            
            ScrollViewReader { scrollView in
                ScrollView(showsIndicators: false){
                    LazyVStack(){
                        ForEach(0..<1000000) { index in
                            
                            if index == 0{
                                Text("Spin!")
                                    .font(.title)         .id(index)
                                    .frame(width: 275, height: 55)
                            }else{
                                Text(attr1[arr1[index]])
                                    .font(.title)                                .id(index)
                                    .frame(width: 275, height: 55)
                            }
                        }
                    }
                }
                .scrollDisabled(true)
                .frame(width: 275, height: 60)
                
                
                .onChange(of: spinn3) { newValue in
                    
                    if newValue {
                        if spinn3{
                            
//                            print("animationIsOn3 start: \(animationIsOn)")
                            animateWithTimer(proxy: scrollView, boh: boh)
                            
                        }
                    }
                }
                
                
            }
//            Button("Block"){
//                blockSpinn3.toggle()
//            }
//            Text(finalText3)
        }
        
        
    }
    
    func animateWithTimer(proxy: ScrollViewProxy, boh: Int) {
        let count: Int = 10
        let duration: Double = 1.0
        let timeInterval: Double = (duration / Double(count))
        var counter = boh
        var check = 0
        
        //        print("\(counter)")
        var random = Int.random(in:(counter + 30)...(counter+70))
        //        let random = Int.random(in: 0...50)
        let timer = Timer.scheduledTimer(withTimeInterval: timeInterval, repeats: true) { (timer) in
            withAnimation(.spring) {
                proxy.scrollTo(counter, anchor: .center)
                //print("fin:\(fin)")
                finalText3 = attr1[arr1[counter]]
                self.boh = counter
                
                
                
            }
            if counter < random {
                counter+=1
                check+=1
            }else{
                if check == 0{
                    random = Int.random(in:(counter + 30)...(counter+70))
                }else{
                    
//                    DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(3), execute: {
                        timer.invalidate()
                        if self.spinn3 == true{
                            self.spinn3.toggle()
                            print("3: random is \(random) and counter is \(counter) and check is \(check)")
                            check = 0
                            random = Int.random(in:(counter + 50)...(counter+100))
                        }
                        
//                    })
                }
                
                
            }
        }
        timer.fire()
        
    }
    
    
    
    
}
#Preview {
    Scrollable3(finalText3: .constant("c")/*,blockSpinn3: .constant(false)*/, spinn3: .constant(false))
}

