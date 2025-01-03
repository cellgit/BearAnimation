//
//  SwiftUIView.swift
//  BearAnimation
//
//  Created by admin on 2025/1/3.
//

import SwiftUI

//public struct BouncingBall: View {
//    @State private var bounce = false
//
//    public init() {}
//
//    public var body: some View {
//        Circle()
//            .fill(Color.red)
//            .frame(width: 50, height: 50)
//            .offset(y: bounce ? -100 : 100)
//            .animation(
//                Animation.easeInOut(duration: 0.6)
//                    .repeatForever(autoreverses: true)
//            )
//            .onAppear {
//                bounce.toggle()
//            }
//    }
//}


public struct BouncingBall: View {
    @Binding public var isBouncing: Bool
    public var size: CGFloat = 50
    public var color: Color = .red
    public var bounceRange: CGFloat = 100
    public var animation: Animation = .easeInOut(duration: 0.6).repeatForever(autoreverses: true)

    @State private var offset: CGFloat = 0

    public var body: some View {
        if #available(iOS 17.0, *) {
            Circle()
                .fill(color)
                .frame(width: size, height: size)
                .offset(y: offset)
                .onChange(of: isBouncing) { (oldalue, newValue) in
                    if newValue {
                        withAnimation(animation) {
                            offset = -bounceRange
                        }
                    } else {
                        offset = 0
                    }
                }
        } else {
            // Fallback on earlier versions
        }
    }
}

public extension View {
    func bouncing(isBouncing: Binding<Bool>) -> some View {
        BouncingBall(isBouncing: isBouncing)
    }
}
