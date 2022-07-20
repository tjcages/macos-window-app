//
//  Subheader.swift
//  swiftuiWindowFun
//
//  Created by Tyler Cagle on 6/15/22.
//

import SwiftUI

struct Subheader: View {
    let text: String
    
    init(_ text: String) {
        self.text = text
    }
    
    var body: some View {
        HStack {
            Text(text)
                .font(.title3)
                .fontWeight(.medium)
                .foregroundColor(.secondary)
                .animateIn(.animationDurationShort, delay: .animationDelayShort)
            
            Spacer()
        }
        .frame(maxWidth: 300)
    }
}

