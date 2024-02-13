//
//  ContentView.swift
//  SpeakBuddyAssessment
//
//  Created by Martin Nash on 2/13/24.
//

import SwiftUI

struct BasicTheme {

    static let shared = BasicTheme()

    let textBaseColor = Color(red: 50/255.0, green: 53/255.0, blue: 55/255.0)

    let backgroundPurple = Color(red: 213/255.0, green: 210/255.0, blue: 1.0)
    let barTop = Color(red: 88/255, green: 19/2552, blue: 1.0)
    let barBottom = Color(red: 34/255.0, green: 14/255.0, blue: 1.0)
    let ctaBlue = Color(red: 59/255.0, green: 167/255.0, blue: 1.0)

    let textGradientTop = Color(red: 101/255.0, green: 203/255.0, blue: 1.0)
    let textGradientBottom = Color(red: 27/255.0, green: 140/255.0, blue: 1.0)

}

struct ContentView: View {
    var body: some View {
        ZStack(content: {
            LinearGradient(colors: [BasicTheme.shared.backgroundPurple, .white], startPoint: .topLeading, endPoint: .bottomTrailing)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .ignoresSafeArea()
                .overlay {
                    RealContentView()
                        .padding()
                }
        })
    }
}

struct RealContentView: View {
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Button(action: {}, label: {
                    Text("X")
                })
            }

            Text("Hello\nSpeakBUDDY")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .multilineTextAlignment(.center)


            Spacer()
            Text("GRAPH")
            Spacer()

            // Added group so that VoiceOver will treat this as one element
            VStack {
                Text("スピークバディで")
                    .font(.title2)
                    .bold()
                    .foregroundColor(BasicTheme.shared.textBaseColor)

                Text("レベルアップ")
                    .font(.largeTitle)
                    .bold()
                    .foregroundLinearGradient(
                        LinearGradient(
                            colors: [BasicTheme.shared.textGradientTop, BasicTheme.shared.textGradientBottom],
                            startPoint: .top,
                            endPoint: .bottom
                        )
                    )
            }
            .accessibilityElement(children: .ignore)
            // VoiceOver would not read out the text when it contained スピークディ
            .accessibilityLabel("このアプリでレベルアップ")


            Button(action: {}, label: {
                Text("プランに登録する")
                    .font(.title)
                    .foregroundColor(Color.white)
            })
            .buttonStyle(CallToActionButtonStyle(backgroundColor: .cyan, borderColor: .white, borderWidth: 1))
            .shadow(radius: 5)

        }
    }
}


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
    ContentView()
}
