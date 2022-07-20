//
//  Main.swift
//  swiftuiWindowFun
//
//  Created by Jonathan Hume on 16/02/2022.
//

import SwiftUI

/// An example ever-present, single instnace view  intended to act a demo for an app main window type of thing.
struct PermanentView: View {
    @EnvironmentObject var appModel: AppModel

    var body: some View {
//        PermanentPureView(
//            openOrRaiseSingletonWindow: appModel.openOrRaiseSingletonWindow,
//            openGenericWindow: appModel.openGenericWindow,
//            singleton: appModel.singletonNSWindow,
//            genericWins: appModel.genericNSWindows
//        )
        FocusedView {
            OnboardingView()
        }
        .frame(minWidth: 600, maxWidth: 1000, minHeight: 424, maxHeight: 800)
        .onChange(of: appModel.permanentNSWindow, perform: { newValue in
            /// Hide the close button - it would be nice to create it without but using url to create means we currently do not have access a-priori access to  the `NSWindow` instance
            /// reference. Could do this in the appModel which might be a bit more performant, but it seems to work okay here and as it's UI it's probably slight more "right" to be
            /// here.

        })
        .background(VisualEffect())
        .ignoresSafeArea(.container, edges: [.bottom, .top])
    }
}

extension NSWindow: Identifiable {
}
