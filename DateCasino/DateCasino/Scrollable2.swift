//
//  Scrollable.swift
//  DateCasino
//
//  Created by Giuseppe Olivari on 21/02/24.
//
import SwiftUI

struct Scrollable2: View {
    @State private var scrollText = false
    @State private var boh = 0
    @State private var animationIsOn = false
    @Binding var spinn2: Bool
    
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
                                    .frame(width: 250, height: 100)
                            } else {
                                Text(attr1[arr1[index]])
                                    .font(.title)
                                    .multilineTextAlignment(.center)
                                    .id(index)
                                    .frame(width: 250, height: 100)
                            }
                        }
                    }
                }
                .scrollDisabled(true)
                .frame(width: 250, height: 100)
                .onChange(of: spinn2) { newValue in
                    if newValue {
                        if spinn2 {
                            animateWithTimer(proxy: scrollView, boh: self.boh)
                                print("spinn2 values are")
                                print(spinn2)
                                spinn2.toggle()
                                print(spinn2)
                        }
                    }
                }
            }
        }
    }
    func animateWithTimer(proxy: ScrollViewProxy, boh: Int ) {
        let count: Int = 8
        let duration: Double = 1.0
        let timeInterval: Double = (duration / Double(count))
        var counter = self.boh
        let random = Int.random(in:(counter + 30)...(counter+70))
        let timer = Timer.scheduledTimer(withTimeInterval: timeInterval, repeats: true) { (timer) in
            withAnimation(.default) {
                proxy.scrollTo(counter, anchor: .center)
                self.boh = counter
            }
            if counter < random {
                counter+=1
                
            }else{
                timer.invalidate()
            }
        }
        timer.fire()
    }
//    func animateWithTimer(proxy: ScrollViewProxy, completion: @escaping () -> Void) {
//        let animationDuration: TimeInterval = 4.0
//        let framesPerSecond = 8
//        let totalDistance = Int(animationDuration * 10) // Adjust the number to control duration of the animation
//        var currentOffset = 0
//        let timer = Timer.scheduledTimer(withTimeInterval: 1.0 / Double(framesPerSecond), repeats: true) { timer in
//            currentOffset += 1
//            if currentOffset <= totalDistance {
//                withAnimation(.linear(duration: animationDuration)) {
//                    proxy.scrollTo(currentOffset, anchor: .center)
//                }
//            } else {
//                timer.invalidate()
//                DispatchQueue.main.async {
//                    print("Animation Completed")
//                    completion()
//                }
//            }
//        }
//        RunLoop.main.add(timer, forMode: .common)
//    }
}
#Preview {
    Scrollable2(spinn2: .constant(false))
}

