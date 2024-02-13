//
//  ContentView.swift
//  SpeakBuddyAssessment
//
//  Created by Martin Nash on 2/13/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {


            Button(action: {}, label: {
                Text("X")
            })

            Text("Title")


            Text("GRAPH")


            // Added group so that VoiceOver will treat this as one element
            Group {
                Text("スピークバディで")
                Text("レベルアップ")
            }
            .accessibilityElement(children: .combine)


            Button(action: {}, label: {
                Text("Call to action Button")
            })

        }
        .padding()
    }
}

#Preview {
    ContentView()
}
