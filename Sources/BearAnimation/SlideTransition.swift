//
//  SwiftUIView.swift
//  BearAnimation
//
//  Created by admin on 2025/1/3.
//

import SwiftUI

public struct SlideTransition: ViewModifier {
    let direction: Edge

    public init(direction: Edge) {
        self.direction = direction
    }

    public func body(content: Content) -> some View {
        content.transition(.move(edge: direction).combined(with: .opacity))
    }
}

public extension AnyTransition {
    static func slide(from edge: Edge) -> AnyTransition {
        .modifier(active: SlideTransition(direction: edge), identity: SlideTransition(direction: edge))
    }
}
