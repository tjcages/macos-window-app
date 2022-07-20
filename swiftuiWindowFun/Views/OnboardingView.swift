//
//  OnboardingView.swift
//  swiftuiWindowFun
//
//  Created by Tyler Cagle on 6/15/22.
//

import SwiftUI

struct OnboardingView: View {
    @EnvironmentObject var appModel: AppModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: .spacingMedium) {
            Header("Meet your next favorite app")
            Subheader("Join the thousands of others who are relearning how to browse the internet.")
            
            Spacer()
            
            HStack {
                Spacer()
                
                ClipButton("Learn more") {
                    appModel.openOrRaiseSingletonWindow()
                }
            }
        }
        .padding(.extraMargin)
    }
}
