//
//  VisualEffect.swift
//  swiftuiWindowFun
//
//  Created by Tyler Cagle on 6/15/22.
//

import SwiftUI

struct VisualEffect: NSViewRepresentable {
    
    private var material: NSVisualEffectView.Material!
    
    init() {
        material = .popover
    }
    
    init(_ material: NSVisualEffectView.Material) {
        self.material = material
    }
    
    func makeNSView(context: Self.Context) -> NSView {
        let view = NSVisualEffectView()
        view.material = material
        return view
    }
    func updateNSView(_ nsView: NSView, context: Context) { }
}
