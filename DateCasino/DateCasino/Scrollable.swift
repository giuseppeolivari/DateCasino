//
//  Scrollable.swift
//  DateCasino
//
//  Created by Giuseppe Olivari on 21/02/24.
//
import SwiftUI

struct Scrollable: View {
    @State private var scrollText = false
    @State private var boh = 0
    @State private var animationIsOn = false
    @Binding var spinn1 : Bool
    
    var attr1 : [String] = ["Hamburger".localized(),
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
                            }else{
                                Text(attr1[arr1[index]])
                                    .font(.title)
                                    .multilineTextAlignment(.center)
                                    .id(index)
                                    .frame(width: 250,height: 100)
                            }
                        }
                    }
                }
                .scrollDisabled(true)
                .frame(width: 250, height: 100)
                .onChange(of: spinn1) { newValue in
                    if newValue {
                        if spinn1{
                            animateWithTimer(proxy: scrollView, boh: self.boh)
                                print(spinn1)
                                spinn1.toggle()
                                print(spinn1)
                            
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
//        let animationDuration: TimeInterval = 60.0
//        let framesPerSecond = 60
//        //let numberOfFrames = Int(animationDuration * Double(framesPerSecond))
//        let totalDistance = Int(animationDuration * 30) // Adjust the number to control duration of the animation
//        var currentOffset = 0
//        let timer = Timer.scheduledTimer(withTimeInterval: 1.0 / Double(framesPerSecond), repeats: true) { timer in
//            currentOffset += 60
//            if currentOffset <= totalDistance {
//                withAnimation(.default) {
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
    Scrollable(spinn1: .constant(false))
}
