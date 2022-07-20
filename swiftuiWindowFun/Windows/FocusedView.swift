//
//  OnboardingView.swift
//  swiftuiWindowFun
//
//  Created by Tyler Cagle on 6/15/22.
//

import SwiftUI

struct FocusedView<Content: View>: View {
    @ViewBuilder var content: Content
    
    var body: some View {
        GeometryReader { metrics in
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    content
                    .frame(width: metrics.size.height * 0.85, height: metrics.size.height * 0.7, alignment: .center)
                    .background(VisualEffect(.titlebar))
                    .clipShape(RoundedRectangle(cornerRadius: .basicCorner, style: .continuous))
                    .overlay(RoundedRectangle(cornerRadius: .basicCorner, style: .continuous).stroke(Color.white.opacity(.borderOpacity)))
                    Spacer()
                }
                Spacer()
            }
        }
    }
}
