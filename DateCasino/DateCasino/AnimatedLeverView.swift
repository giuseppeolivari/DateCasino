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
    @Binding var animationIsOn: Bool
    @State private var leverPosition: Int = 0
    @State private var dragOffset: CGSize = .zero
    var action: () -> Void
    let leverPositions = ["lever1", "lever2", "lever3", "lever4", "lever5", "lever6", "lever7", "lever8" ]
    var body: some View {
        let dragGesture = DragGesture()
            .onChanged { value in
                let distance = value.translation.height
                let positionChange = Int(distance / 100)
                let newPosition = min(max(self.leverPosition + positionChange, 0), self.leverPositions.count - 1)
                self.leverPosition = newPosition
                if !animationIsOn && !spinn1 && !spinn2 && !spinn3 {
                    animationIsOn.toggle()
                }
            }
            .onEnded { _ in
                self.dragOffset = .zero
                withAnimation {
                    self.leverPosition = 0
                }
            }
        return Image(leverPositions[leverPosition])
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 80, height: 210)
            .offset(dragOffset)
            .gesture(dragGesture)
            .animation(.none)
            .onChange(of: leverPosition) { newValue in
                if newValue == leverPositions.count - 1 {
                    if animationIsOn && !spinn1 && !spinn2 && !spinn3 {
                        action()
                        print("spamming")
                    }
                    self.animationIsOn.toggle()
                }
            }
    }
    //    func startAnimation() {
    //        var counter = 1
    //
    //        let timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { _ in
    //            withAnimation(.none) {
    //                leverPosition = counter % leverPositions.count
    //            }
    //            counter += 1
    //        }
    //
    //        DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
    //            timer.invalidate()
    //            let timer2 = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { _ in
    //                withAnimation(.none) {
    //                    leverPosition = counter % leverPositions.count
    //                }
    //                counter -= 1
    //            }
    //            DispatchQueue.main.asyncAfter(deadline: .now() + 0.7) {
    //                timer2.invalidate()
    //                animationIsOn.toggle()
    //            }
    //        }
    //    }
}

#Preview {
    AnimatedLeverView(spinn1: .constant(false),spinn2: .constant(false),spinn3: .constant(false), animationIsOn: .constant(false),action: {})
}
