//
//  SwiftUIView.swift
//  BearAnimation
//
//  Created by admin on 2025/1/3.
//

import SwiftUI

//public struct BounceEffect: ViewModifier {
//    @State private var scale: CGFloat = 1.0
//
//    public func body(content: Content) -> some View {
//        content
//            .scaleEffect(scale)
//            .onAppear {
//                withAnimation(
//                    Animation.interpolatingSpring(stiffness: 100, damping: 5)
//                        .repeatForever(autoreverses: true)
//                ) {
//                    scale = 1.2
//                }
//            }
//    }
//}
//
//public extension View {
//    func bounce() -> some View {
//        self.modifier(BounceEffect())
//    }
//}



public struct BounceEffect: ViewModifier {
    @Binding public var isAnimating: Bool
    public var scaleRange: ClosedRange<CGFloat> = 1.0...1.2
    public var animation: Animation = .interpolatingSpring(stiffness: 100, damping: 5).repeatForever(autoreverses: true)

    @State private var scale: CGFloat = 1.0

    public func body(content: Content) -> some View {
        if #available(iOS 17.0, *) {
            content
                .scaleEffect(scale)
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
            
        }
    }
}

public extension View {
    func bounce(isAnimating: Binding<Bool>) -> some View {
        self.modifier(BounceEffect(isAnimating: isAnimating))
    }
}








//struct ContentView: View {
//    var body: some View {
//        Text("弹跳动画")
//            .font(.largeTitle)
//            .bounce()
//    }
//}
