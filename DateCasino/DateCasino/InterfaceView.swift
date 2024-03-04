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
    let backgrounds = ["Slot1", "Slot2", "Slot3", "Slot4"]
    var body: some View {
        
          
            
            ZStack {
           
                
                GeometryReader { geometryReader in  Image(backgrounds[backgroundLightLevel])
                        .resizable()
                        .frame(width: geometryReader.size.width,height: geometryReader.size.height)
                        .position(x: geometryReader.size.width / 2.1, y: geometryReader.size.height / 1.43)
                        .ignoresSafeArea()
                        .onChange(of: animationIsOn) { newValue in
                            if newValue {
                                if animationIsOn{
                                    startAnimation()
                                }
                            }
                        }
                }
            }.background(Image("Background"))
        
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
