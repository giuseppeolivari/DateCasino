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
                            animateWithTimer(proxy: scrollView) {
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
    }
    
    func animateWithTimer(proxy: ScrollViewProxy, completion: @escaping () -> Void) {
        let animationDuration: TimeInterval = 6.0
        let framesPerSecond = 60
        let numberOfFrames = Int(animationDuration * Double(framesPerSecond))
        let totalDistance = Int(animationDuration * 30) // Adjust the number to control duration of the animation
        var currentOffset = 0
        let timer = Timer.scheduledTimer(withTimeInterval: 1.0 / Double(framesPerSecond), repeats: true) { timer in
            currentOffset += 1
            if currentOffset <= totalDistance {
                withAnimation(.linear(duration: animationDuration)) {
                    proxy.scrollTo(currentOffset, anchor: .center)
                }
            } else {
                timer.invalidate()
                DispatchQueue.main.async {
                    print("Animation Completed")
                    completion()
                }
            }
        }
        RunLoop.main.add(timer, forMode: .common)
    }
}
#Preview {
    Scrollable2(finalText2: .constant("b"), spinn2: .constant(false))
}

