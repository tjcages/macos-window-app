//
//  Screen.swift
//  swiftuiWindowFun
//
//  Created by Tyler Cagle on 6/15/22.
//

import SwiftUI

class Screen {
#if os(watchOS)
    static var deviceWidth:CGFloat = WKInterfaceDevice.current().screenBounds.size.width
#elseif os(iOS)
    static var deviceWidth:CGFloat = UIScreen.main.bounds.size.width
#elseif os(macOS)
    static var width: CGFloat = NSScreen.main?.visibleFrame.size.width ?? 0
    static var height: CGFloat = NSScreen.main?.visibleFrame.size.height ?? 0
#endif
}
