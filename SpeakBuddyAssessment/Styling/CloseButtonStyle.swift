//
//  CloseButtonStyle.swift
//  SpeakBuddyAssessment
//
//  Created by Martin Nash on 2/14/24.
//

import SwiftUI

struct CloseButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .bold()
            .foregroundStyle(BasicTheme.shared.textBaseColor)
            .background {
                Circle()
                    .foregroundStyle(.white)
            }
            .opacity(configuration.isPressed ? 0.5 : 1.0)
            .shadow(radius: 5)
    }
}



#Preview {
    Group {
        Button(action: { print("Pressed") }) {
            Image(systemName: "xmark")
                .frame(width: 38, height: 38)
        }
        .buttonStyle(CloseButtonStyle())
    }
}
