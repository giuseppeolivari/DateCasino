//
//  AnimatedLeverView.swift
//  DateCasino
//
//  Created by Dylan Corvo on 23/02/24.
//
import SwiftUI

struct AnimatedLeverView: View {
    @State private var animationIsOn = false
    @State var action: () -> Void
    @State var leverPosition: Int = 0
    let leverPositions = ["lever1", "lever2", "lever3", "lever4", "lever5", "lever6", "lever7", "lever8" ]
    var body: some View {
        Button(action: {
            if(!animationIsOn){
                animationIsOn.toggle()
                startAnimation()
                action()
            }else{
                
            }
        }) {
            Image(leverPositions[leverPosition])
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 100)
        }

    }
    func startAnimation() {
       
        var counter = 1
        
        let timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { _ in
            withAnimation(.default) {
                leverPosition = counter % leverPositions.count
            }
            counter += 1
        }
        
        // Stop the animation after a certain number of iterations
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
            timer.invalidate()
            let timer2 = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { _ in
                withAnimation(.default) {
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
    AnimatedLeverView(action: {})
}