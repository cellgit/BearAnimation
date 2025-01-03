//
//  SwiftUIView.swift
//  BearAnimation
//
//  Created by admin on 2025/1/3.
//

import SwiftUI

public struct BouncingBall: View {
    @State private var bounce = false

    public init() {}

    public var body: some View {
        Circle()
            .fill(Color.red)
            .frame(width: 50, height: 50)
            .offset(y: bounce ? -100 : 100)
            .animation(
                Animation.easeInOut(duration: 0.6)
                    .repeatForever(autoreverses: true)
            )
            .onAppear {
                bounce.toggle()
            }
    }
}
