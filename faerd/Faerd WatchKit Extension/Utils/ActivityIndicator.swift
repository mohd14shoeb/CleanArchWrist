//
//  ActivityIndicator.swift
//  BusTime WatchKit Extension
//
//  Created by Håkon Strandlie on 24/12/2019.
//  Copyright © 2019 Håkon Strandlie. All rights reserved.
//

import SwiftUI


struct ActivityIndicator: View {
    
    @State private var isAnimating = false
    
    var body: some View {
        GeometryReader { (geometry: GeometryProxy) in
            ForEach(0..<5) { index in
                let scaleEffectA = 0.2 + CGFloat(index) / 5
                let scaleEffect = 1 - CGFloat(index) / 5
                let timingCurve = 0.15 + Double(index) / 5
                Group {
                    Circle()
                        .frame(width: geometry.size.width / 5, height: geometry.size.height / 5)
                        .scaleEffect(self.isAnimating ? scaleEffectA : scaleEffect)
                        .offset(y: geometry.size.width / 10 - geometry.size.height / 2)
                }
                .frame(width: geometry.size.width, height: geometry.size.height)
                .rotationEffect(!self.isAnimating ? .degrees(0) : .degrees(360))
                .animation(Animation
                    .timingCurve(0.5, timingCurve, 0.25, 1, duration: 1.5)
                    .repeatForever(autoreverses: false))
            }
        }.aspectRatio(1, contentMode: .fit)
        .onAppear {
            self.isAnimating = true
        }
    }
}

struct ActivityIndicator_Previews: PreviewProvider {
    static var previews: some View {
        ActivityIndicator().frame(width: 50, height: 50)
    }
}
