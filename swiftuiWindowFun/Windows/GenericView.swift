//
//  Generic.swift
//  swiftuiWindowFun
//
//  Created by Jonathan Hume on 25/02/2022.
//

import SwiftUI

struct GenericView: View {
    @EnvironmentObject var appModel: AppModel
    @SceneStorage("navtitle") private var navTitle: String = "Not set"
    
    var body: some View {
        VStack {
            Text("Hello from generic window \(navTitle)")
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .navigationTitle(navTitle)
        .onOpenURL(perform: { url in
            print("Got opened from a URL \(url)")
            navTitle = AppModel.titleFromUrl(url) ?? "Set failed"
        })
        .onChange(of: appModel.keyWindow, perform: { newValue in
            /// Hide the close button - it would be nice to create it without but using url to create means we currently do not have access a-priori access to  the `NSWindow` instance
            /// reference. Could do this in the appModel which might be a bit more performant, but it seems to work okay here and as it's UI it's probably slight more "right" to be
            /// here.
            if let newValue = newValue {
                newValue.titlebarAppearsTransparent = true
                newValue.backgroundColor = .clear
            }
        })
        .background(VisualEffect())
        .ignoresSafeArea(.container, edges: [.bottom, .top])
        .handlesExternalEvents(preferring: [navTitle], allowing: [navTitle])
        /// Any instance of this view AND with this title, then raise rather than
        /// create a new instance
    }
}

/// See note on  previews in `SingletonView`
