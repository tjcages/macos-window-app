//
//  Button.swift
//  swiftuiWindowFun
//
//  Created by Tyler Cagle on 6/15/22.
//

import SwiftUI

struct ClipButton: View {
    
    @State private var hovering = false
    
    let text: String
    let action: () -> Void
    
    init(_ text: String, action: @escaping () -> Void) {
        self.text = text
        self.action = action
    }
    
    var body: some View {
        Button {
            action()
        } label: {
            ButtonText(text)
                .padding(.horizontal, .buttonHorizontal)
                .padding(.vertical, .buttonVertical)
                .contentShape(Rectangle())
        }
        .buttonStyle(.plain)
        .background(.blue)
        .clipShape(RoundedRectangle(cornerRadius: .buttonCorner, style: .continuous))
        .overlay(RoundedRectangle(cornerRadius: .buttonCorner, style: .continuous).stroke(Color.white.opacity(.buttonBorderOpacity)))
        .offset(x: 0, y: hovering ? -4 : 0)
        .scaleEffect(CGSize(width: hovering ? 1.01 : 1, height: hovering ? 1.01 : 1))
        .shadow(color: Color.blue.opacity(hovering ? .shadowHoverOpacity : .shadowOpacity), radius: hovering ? .shadowHoverRadius : .shadowRadius, x: 0, y: 4)
        .onHover { hovering in
            if hovering {
                NSCursor.openHand.set()
            } else {
                NSCursor.pop()
            }
            
            withAnimation {
                self.hovering = hovering
            }
        }
    }
}
