//
//  Delay.swift
//  swiftuiWindowFun
//
//  Created by Tyler Cagle on 6/15/22.
//

import Foundation

public func delay(_ delay: Double, _ action: @escaping () -> Void) {
    DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
        action()
    }
}
