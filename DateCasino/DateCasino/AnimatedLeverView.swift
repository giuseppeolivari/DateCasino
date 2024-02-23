//
//  AnimatedLeverView.swift
//  DateCasino
//
//  Created by Dylan Corvo on 23/02/24.
//
import SwiftUI

struct AnimatedLeverView: View {
    @State var leverPosition: Int = 0
    let leverPositions = ["lever1", "lever2", "lever3", "lever4", "lever5", "lever6", "lever7", "lever8" ]
    var body: some View {
        Button(action: {
            startAnimation()
        }) {
            Image(leverPositions[leverPosition])
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 100)
        }

    }
    func startAnimation() {
        var counter = 0
        
        let timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { _ in
            withAnimation(.default) {
                leverPosition = counter % leverPositions.count
            }
            counter += 1
        }
        
        // Stop the animation after a certain number of iterations
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.9) {
            timer.invalidate()
        }
    }
}

#Preview {
    AnimatedLeverView()
}
