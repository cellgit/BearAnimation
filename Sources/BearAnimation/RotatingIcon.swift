//
//  SwiftUIView.swift
//  BearAnimation
//
//  Created by admin on 2025/1/3.
//

import SwiftUI

//public struct RotatingIcon: View {
//    @State private var rotation: Double = 0
//
//    public init() {}
//
//    public var body: some View {
//        Image(systemName: "arrow.2.circlepath")
//            .resizable()
//            .frame(width: 50, height: 50)
//            .rotationEffect(.degrees(rotation))
//            .onAppear {
//                withAnimation(Animation.linear(duration: 2).repeatForever(autoreverses: false)) {
//                    rotation = 360
//                }
//            }
//    }
//}


import SwiftUI

public struct RotatingIcon: View {
    @Binding public var isRotating: Bool
    public var duration: Double = 2.0
    public var size: CGFloat = 50

    @State private var rotation: Double = 0

    public var body: some View {
        if #available(iOS 17.0, *) {
            Image(systemName: "arrow.2.circlepath")
                .resizable()
                .frame(width: size, height: size)
                .rotationEffect(.degrees(rotation))
                .onChange(of: isRotating) { (oldValue, newValue) in
                    if newValue {
                        withAnimation(Animation.linear(duration: duration).repeatForever(autoreverses: false)) {
                            rotation = 360
                        }
                    } else {
                        rotation = 0
                    }
                }
        } else {
            // Fallback on earlier versions
        }
    }
}

public extension View {
    func rotating(isRotating: Binding<Bool>) -> some View {
        RotatingIcon(isRotating: isRotating)
    }
}
