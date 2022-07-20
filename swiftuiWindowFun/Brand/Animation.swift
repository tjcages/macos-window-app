//
//  Animation.swift
//  swiftuiWindowFun
//
//  Created by Tyler Cagle on 6/15/22.
//

import SwiftUI

extension Text {
    func animateIn() -> some View {
        modifier(AnimateIn())
    }
    
    func animateIn(_ duration: CGFloat) -> some View {
        modifier(AnimateIn(duration))
    }
    
    func animateIn(_ duration: CGFloat, delay: CGFloat) -> some View {
        modifier(AnimateIn(duration, delay: delay))
    }
}

struct AnimateIn: ViewModifier {
    @State private var hidden = true
    
    let duration: CGFloat
    let delayDuration: CGFloat
    
    init() {
        duration = .animationDurationShort
        delayDuration = .animationDelayNone
    }
    
    init(_ duration: CGFloat) {
        self.duration = duration
        delayDuration = .animationDelayNone
    }
    
    init(_ duration: CGFloat, delay: CGFloat) {
        self.duration = duration
        self.delayDuration = delay
    }
    
    func body(content: Content) -> some View {
        content
            .opacity(hidden ? 0 : 1)
            .offset(x: 0, y: hidden ? 12 : 0)
            .onAppear {
                delay(delayDuration) {
                    withAnimation {
                        hidden.toggle()
                    }
                }
            }
    }
}

extension CGFloat {
    // MARK: -- Durations
    static let animationDurationShort: CGFloat = 0.2
    static let animationDurationLong: CGFloat = 0.4
    static let animationDurationDrawn: CGFloat = 1.0
    
    // MARK: -- Delays
    static let animationDelayNone: CGFloat = 0
    static let animationDelayShort: CGFloat = 0.2
    static let animationDelayLong: CGFloat = 0.4
}
