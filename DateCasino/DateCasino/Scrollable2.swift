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
    @State private var animationIsOn = false
    //@Binding  var blockSpinn2 : Bool
    @Binding var spinn2 : Bool
    
    var attr1 : [String] = ["Cinema",
                            "Ice skating",
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
    
    let arr1 = (0..<1000000).map( {_ in Int.random(in: 0...5)} )
    
    
    
    var body: some View {
        
        
        VStack{
            
            ScrollViewReader { scrollView in
                ScrollView(showsIndicators: false){
                    LazyVStack(){
                        ForEach(0..<1000000) { index in
                            
                            if index == 0{
                                Text("Spin!")
                                    .font(.title)                                .id(index)
                                    .frame(width: 275, height: 80)
                            }else{
                                Text(attr1[arr1[index]])
                                    .font(.title)
                                    .id(index)
                                    .frame(width: 275, height: 80)
                                
                            }
                        }
                    }
                }
                .scrollDisabled(true)
                .frame(width: 275, height: 80)
                
                
                .onChange(of: spinn2) { newValue in
                    
                    if newValue {
                        if spinn2{
                            
//                            print("animationIsOn2 start: \(animationIsOn)")
                            animateWithTimer(proxy: scrollView, boh: boh)
                            
                        }
                    }
                }
                
                
            }
//            Button("Block"){
//                blockSpinn2.toggle()
//            }
//            Text(finalText2)
            
        }
        
        
    }
    
    func animateWithTimer(proxy: ScrollViewProxy, boh: Int) {
        let count: Int = 10
        let duration: Double = 1.0
        let timeInterval: Double = (duration / Double(count))
        var counter = boh
        var check = 0
        //        print("\(counter)")
        var random = Int.random(in:(counter + 50)...(counter+100))
        //        let random = Int.random(in: 0...50)
        let timer = Timer.scheduledTimer(withTimeInterval: timeInterval, repeats: true) { (timer) in
            withAnimation(.spring) {
                proxy.scrollTo(counter, anchor: .center)
                
                //print("fin:\(fin)")
                finalText2 = attr1[arr1[counter]]
                self.boh = counter
                
                
                
            }
            if counter < random {
                counter+=1
                check+=1
            }else{
                if check == 0{
                    random = Int.random(in:(counter + 50)...(counter+100))
                }else{
//                    DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(3), execute: {
                        timer.invalidate()
                        if self.spinn2 == true{
                            self.spinn2.toggle()
                            print("2: random is \(random) and counter is \(counter) and check is \(check)")
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
    Scrollable2(finalText2: .constant("b")/*,blockSpinn2: .constant(false)*/, spinn2: .constant(false))
}

