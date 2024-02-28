//
//  AnimatedLeverView.swift
//  DateCasino
//
//  Created by Dylan Corvo on 23/02/24.
//
import SwiftUI

struct AnimatedLeverView: View {
    @Binding var spinn1 : Bool
    @Binding var spinn2 : Bool
    @Binding var spinn3 : Bool
    @State private var animationIsOn = false
    @State var action: () -> Void
    @State var leverPosition: Int = 0
    let leverPositions = ["lever1", "lever2", "lever3", "lever4", "lever5", "lever6", "lever7", "lever8" ]
    var body: some View {
        Button(action: {
            if(!animationIsOn && !spinn1 && !spinn2 && !spinn3){
                animationIsOn.toggle()
                startAnimation()
                action()
                print("here does the animation")
            }else{
                
            }
        }) {
            Image(leverPositions[leverPosition])
                .resizable()
                .ignoresSafeArea()
                .aspectRatio(contentMode: .fit)
                .frame(width: 80, height: 210, alignment: .trailing)
        }
        
    }
    func startAnimation() {
        
        var counter = 1
        
        let timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { _ in
            withAnimation(.none) {
                leverPosition = counter % leverPositions.count
            }
            counter += 1
        }
        
        // Stop the animation after a certain number of iterations
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
            timer.invalidate()
            let timer2 = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { _ in
                withAnimation(.none) {
                    leverPosition = counter % leverPositions.count
                }
                counter -= 1
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.7) {
                timer2.invalidate()
                animationIsOn.toggle()
            }
            
        }
        
        
        
    }
}

#Preview {
    AnimatedLeverView(spinn1: .constant(false),spinn2: .constant(false),spinn3: .constant(false),action: {})
}
