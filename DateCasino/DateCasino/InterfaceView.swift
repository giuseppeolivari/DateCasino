//
//  InterfaceView.swift
//  DateCasino
//
//  Created by Dylan Corvo on 28/02/24.
//

import SwiftUI

struct InterfaceView: View {
    @Binding var animationIsOn: Bool
    @State var backgroundLightLevel: Int = 0
    let backgrounds = ["background", "Background_Lights_On"]
    var body: some View {
        GeometryReader { geometryReader in
          
            
            Image(backgrounds[backgroundLightLevel])
                .resizable()
                .frame(width: geometryReader.size.width / 2, height: geometryReader.size.height / 2)
                .ignoresSafeArea()
                .onChange(of: animationIsOn) { newValue in
                    if newValue {
                        if animationIsOn{
                            startAnimation()
                        }
                    }
            }
        }
    }
    func startAnimation() {
        var counter = 1
        let timer = Timer.scheduledTimer(withTimeInterval: 0.3, repeats: true) { _ in
            withAnimation(.none) {
                backgroundLightLevel = counter % backgrounds.count
            }
            counter += 1
        }
        // Stop the animation after a certain number of iterations
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            timer.invalidate()
            let timer2 = Timer.scheduledTimer(withTimeInterval: 0.3, repeats: true) { _ in
                withAnimation(.none) {
                    backgroundLightLevel = counter % backgrounds.count
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
    InterfaceView(animationIsOn: .constant(false))
}
