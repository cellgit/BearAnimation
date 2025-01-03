//
//  SwiftUIView.swift
//  BearAnimation
//
//  Created by admin on 2025/1/3.
//

import SwiftUI

public struct RotatingIcon: View {
    @State private var rotation: Double = 0

    public init() {}

    public var body: some View {
        Image(systemName: "arrow.2.circlepath")
            .resizable()
            .frame(width: 50, height: 50)
            .rotationEffect(.degrees(rotation))
            .onAppear {
                withAnimation(Animation.linear(duration: 2).repeatForever(autoreverses: false)) {
                    rotation = 360
                }
            }
    }
}
