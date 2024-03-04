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
    let backgrounds = ["slot1".localized(), "slot2".localized(), "slot3".localized(), "slot4".localized()]
    var body: some View {
        
          
            
            ZStack {
           
                
                GeometryReader { geometryReader in  Image(backgrounds[backgroundLightLevel])
                        .resizable()
                        .position(x: geometryReader.size.width / 2,y: geometryReader.size.height / 1.81)
                        .onChange(of: animationIsOn) { newValue in
                            if newValue {
                                if animationIsOn{
                                    startAnimation()
                                }
                            }
                        }
                }
            }
        
    }
    func startAnimation() {
        var counter = 1
        let timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { _ in
            withAnimation(.none) {
                backgroundLightLevel = counter % backgrounds.count
            }
            counter += 1
        }
        // Stop the animation after a certain number of iterations
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            timer.invalidate()
            let timer2 = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { _ in
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
