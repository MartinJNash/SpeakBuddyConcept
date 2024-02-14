//
//  View+MaskedForegroundLinearGradient.swift
//  SpeakBuddyAssessment
//
//  Created by Martin Nash on 2/14/24.
//

import SwiftUI

extension View {
    // Function color view as linear gradient
    // Inspiration: https://sarunw.com/posts/how-to-render-text-with-color-gradient-in-swiftui/
    public func foregroundLinearGradient(_ linearGradient: LinearGradient) -> some View {
        self.overlay {
            linearGradient
            .mask(
                self
            )
        }
    }
}

#Preview {

    let verticalRainbow = LinearGradient(colors: [.red, .orange, .yellow, .green, .blue, .indigo, .purple], startPoint: .top, endPoint: .bottom)

    return Group {

        Rectangle()
            .frame(width: 100, height: 100)
            .foregroundLinearGradient(verticalRainbow)
            .border(.orange)

        Image(systemName: "globe")
            .resizable()
            .frame(width: 100, height: 100)
            .foregroundLinearGradient(verticalRainbow)

        Text("Hello")
            .font(.system(size: 100))
            .bold()
            .foregroundLinearGradient(verticalRainbow)
            .border(.orange)

        Text("虹")
            .font(.system(size: 100))
            .bold()
            .foregroundLinearGradient(verticalRainbow)
            .border(.orange)

    }

}
