//
//  SwiftUIView.swift
//  BearAnimation
//
//  Created by admin on 2025/1/3.
//

import SwiftUI

public struct PulsingCircle: View {
    @Binding public var isAnimating: Bool
    public var size: CGFloat = 100
    public var color: Color = .blue
    public var scaleRange: ClosedRange<CGFloat> = 1.0...1.5
    public var animation: Animation = .easeInOut(duration: 1.5).repeatForever(autoreverses: true)

    @State private var scale: CGFloat = 1.0
    public var body: some View {
        if #available(iOS 17.0, *) {
            Circle()
                .fill(color)
                .frame(width: size, height: size)
                .scaleEffect(scale)
                .opacity(0.7)
                .onChange(of: isAnimating) { (oldValue, newValue) in
                    if newValue {
                        withAnimation(animation) {
                            scale = scaleRange.upperBound
                        }
                    } else {
                        scale = scaleRange.lowerBound
                    }
                }
        } else {
            // Fallback on earlier versions
        }
    }
}

public extension View {
    func pulsing(isAnimating: Binding<Bool>) -> some View {
        PulsingCircle(isAnimating: isAnimating)
    }
}
