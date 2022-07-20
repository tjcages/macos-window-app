//
//  Text.swift
//  swiftuiWindowFun
//
//  Created by Tyler Cagle on 6/15/22.
//

import SwiftUI

struct Header: View {
    let text: String
    
    init(_ text: String) {
        self.text = text
    }
    
    var body: some View {
        Text(text)
            .font(Font.system(size: 32))
            .fontWeight(.bold)
            .foregroundColor(.primary)
            .animateIn()
    }
}
