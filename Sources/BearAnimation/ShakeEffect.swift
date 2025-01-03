//
//  SwiftUIView.swift
//  BearAnimation
//
//  Created by admin on 2025/1/3.
//

import SwiftUI

public struct ShakeEffect: GeometryEffect {
    public var amount: CGFloat = 10
    public var shakesPerUnit = 3
    public var animatableData: CGFloat

    public init(amount: CGFloat = 10, shakesPerUnit: Int = 3, animatableData: CGFloat) {
        self.amount = amount
        self.shakesPerUnit = shakesPerUnit
        self.animatableData = animatableData
    }

    public func effectValue(size: CGSize) -> ProjectionTransform {
        ProjectionTransform(
            CGAffineTransform(translationX: amount * sin(animatableData * .pi * CGFloat(shakesPerUnit)), y: 0)
        )
    }
}

public extension View {
    func shake(times: Int) -> some View {
        modifier(ShakeEffect(animatableData: CGFloat(times)))
    }
}
