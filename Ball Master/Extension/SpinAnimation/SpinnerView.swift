//
//  SpinnerView.swift
//  Ball Master
//
//  Created by admin on 24.05.2024.
//

import SwiftUI

struct SpinnerView: View {
    @State var isAnimating = false
    
    func foreverAnimation(_ thisDelay: Double = 0) -> Animation {
        return Animation.easeInOut(duration: 1.5)
            .repeatForever(autoreverses: false)
            .delay(thisDelay/6)
    }
    
    var numberOfCircules = 6
    
    var body: some View {
        ZStack {
            ForEach(0..<numberOfCircules) { i in
                VStack {
                    Circle().frame(width: 6,height: 6)
                        .foregroundColor(.white)
                    Spacer()
                }.frame(width: 35,height: 35)
                    .opacity(1 - (Double(i)/Double(numberOfCircules)))
                    .rotationEffect(Angle(degrees: isAnimating ? 360 : 0))
                    .animation(foreverAnimation(Double(i)))
                    .onAppear {
                        isAnimating = true
                    }
            }
          
        }
    }
}

#Preview {
    SpinnerView()
}
