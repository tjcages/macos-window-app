//
//  Window2.swift
//  moreSwiftuiWindowFun
//
//  Created by Jonathan Hume on 17/02/2022.
//

import SwiftUI

// MARK: -- Window Size
extension CGFloat {
    static let singletonIdealWidth: CGFloat = 400.0
    static let singletonIdealHeight: CGFloat = 600.0
}

/// An example ever present, single instnace view  intended to act a demo for an app main window type of thing.
struct SingletonView: View {
    @EnvironmentObject var appModel: AppModel

    var body: some View {
        VStack {
            Text("Hello from the singleton window")
        }
        .frame(width: .singletonIdealWidth, height: .singletonIdealHeight)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
//        .frame(minWidth: 400, idealWidth: .singletonIdealWidth, maxWidth: .infinity, minHeight: 600, idealHeight: .singletonIdealHeight, maxHeight: .infinity)
        .onChange(of: appModel.singletonNSWindow, perform: { newValue in
            /// Hide the close button - it would be nice to create it without but using url to create means we currently do not have access a-priori access to  the `NSWindow` instance
            /// reference. Could do this in the appModel which might be a bit more performant, but it seems to work okay here and as it's UI it's probably slight more "right" to be
            /// here.
            if let newValue = newValue {
                newValue.setFrameOrigin(NSPoint(x: Screen.width - .singletonIdealWidth - .screenMargin, y: .screenMargin))
            }
        })
        .background(VisualEffect())
        .ignoresSafeArea(.container, edges: [.bottom, .top])
        .handlesExternalEvents(  /// Any instance of this view, raise it rather than create it afresh
            preferring: [AppConfig.SingletonWinConfig.uriHost],
            allowing: [AppConfig.SingletonWinConfig.uriHost]
        )
    }
}

/// Disadvantage with opening windows via the openURL is we can't do previews for something like this. Workaround for more complex cases is to split the view
/// into an State and Pure view components, as is demonstrated with `PermanentView` and `PermanentPureView` .
