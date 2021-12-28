//
//  MotionAnimationView.swift
//  Africa
//
//  Created by Nguyễn Hồng Lĩnh on 28/12/2021.
//

import SwiftUI

struct MotionAnimationView: View {
    // MARK: - Properties
    @State private var randomCircle = Int.random(in: 12...16)
    
    @State private var isAnimating: Bool = false
    
    // MARK: - Function
    // 1. Random coordinate
    private func randomCoordinate(max: CGFloat) -> CGFloat {
        return CGFloat.random(in: 0...max)
    }
    
    // 2. Random size
    private func randomSize() -> CGFloat {
        return CGFloat.random(in: 10...300)
    }
    
    // 3. Random scale
    private func randomScale() -> CGFloat {
        return CGFloat.random(in: 0.1...2.0)
    }
    
    // 4. Random speed
    private func randomSpeed() -> Double {
        return Double.random(in: 0.25...1)
    }
    
    // 5. Random delay
    private func randomDelay() -> Double {
        return Double.random(in: 0...2.0)
    }
    
    // MARK: - Body
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                ForEach(0...randomCircle, id: \.self) { item in
                    Circle()
                        .foregroundColor(.gray)
                        .opacity(0.15)
                        .frame(width: randomSize(), height: randomSize())
                        .scaleEffect(isAnimating ? randomScale() : 1)
                        .position(
                            x: randomCoordinate(max: geometry.size.width),
                            y: randomCoordinate(max: geometry.size.height))
                        .animation(
                            Animation.interpolatingSpring(stiffness: 0.5, damping: 0.5)
                                .speed(randomSpeed())
                                .delay(randomDelay())
                        )
                        .onAppear {
                            isAnimating = true
                        }
                } //: Loop
            } //: ZStack
            .drawingGroup()
            
        }
    }
}

struct MotionAnimationView_Previews: PreviewProvider {
    static var previews: some View {
        MotionAnimationView()
    }
}
