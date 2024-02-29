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
    
    let arr1 = (0..<1000000).map( {_ in Int.random(in: 0...5)} )
    
    var body: some View {
        VStack{
            ScrollViewReader { scrollView in
                ScrollView(showsIndicators: false){
                    LazyVStack(){
                        ForEach(0..<1000000) { index in
                            
                            if index == 0{
                                Text("Spin!")
                                    .font(.title)
                                    .multilineTextAlignment(.center)
                                    .id(index)
                                    .frame(width: 275, height: 100)
                            }else{
                                Text(attr1[arr1[index]])
                                    .font(.title)
                                    .multilineTextAlignment(.center)
                                    .id(index)
                                    .frame(width: 275, height: 100)
                                
                            }
                        }
                    }
                }
                .scrollDisabled(true)
                .frame(width: 275, height: 100)
                .onChange(of: spinn2) { newValue in
                    if newValue {
                        if spinn2{
                            animateWithTimer(proxy: scrollView, boh: boh)
                        }
                    }
                }
            }
        }
    }
    func animateWithTimer(proxy: ScrollViewProxy, boh: Int ) {
        var counter = self.boh
        var check = 0
        var random = Int.random(in:(counter + 1000)...(counter+1040))
        let timer = Timer.scheduledTimer(withTimeInterval: 0, repeats: true) { (timer) in
            withAnimation(.linear) {
                proxy.scrollTo(counter, anchor: .center)
                self.boh = counter
            }
            if counter < random {
                counter += 1
                check += 1
            }else{
                if check == 0{
                    random = Int.random(in:(counter + 1000)...(counter+1040))
                }else{
                    timer.invalidate()
                    if self.spinn2 == true{
                        self.spinn2.toggle()
                        print("3: random is \(random) and counter is \(counter) and check is \(check)")
                        check = 0
                        random = Int.random(in:(counter + 1000)...(counter+1040))
                    }
                }
            }
        }
        timer.fire()
        
    }
    
}
#Preview {
    Scrollable2(finalText2: .constant("b")/*,blockSpinn2: .constant(false)*/, spinn2: .constant(false))
}

