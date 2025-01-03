//
//  SwiftUIView.swift
//  BearAnimation
//
//  Created by admin on 2025/1/3.
//

import SwiftUI

public struct PulsingCircle: View {
    @State private var scale: CGFloat = 1.0

    public init() {}

    public var body: some View {
        Circle()
            .fill(Color.blue)
            .frame(width: 100, height: 100)
            .scaleEffect(scale)
            .opacity(0.7)
            .onAppear {
                withAnimation(
                    Animation.easeInOut(duration: 1.5).repeatForever(autoreverses: true)
                ) {
                    scale = 1.5
                }
            }
    }
}
