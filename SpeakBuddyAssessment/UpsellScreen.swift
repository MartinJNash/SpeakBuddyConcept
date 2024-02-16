import SwiftUI

struct UpsellScreen: View {
    var body: some View {
        LinearGradient(colors: [BasicTheme.shared.backgroundPurple, .white], startPoint: .topLeading, endPoint: .bottomTrailing)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .ignoresSafeArea()
            .overlay {
                RealContentView()
                    .padding()
            }
    }
}

struct RealContentView: View {
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Button(action: { print("Dismiss") }) {
                    Image(systemName: "xmark")
                        .frame(width: 38, height: 38)
                }
                .buttonStyle(CloseButtonStyle())
            }

            Text("Hello\nSpeakBUDDY")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .multilineTextAlignment(.center)


            Spacer(minLength: 85)
            graph()
            Spacer(minLength: 30)

            // Added group so that VoiceOver will treat this as one element
            VStack {
                Text("スピークバディで")
                    .font(.title2)
                    .bold()

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


            Button(action: { print("Register") }, label: {
                Text("プランに登録する")
                    .font(.title)
                    .foregroundColor(Color.white)
                    .frame(maxWidth: 500)
            })
            .buttonStyle(CallToActionButtonStyle(backgroundColor: BasicTheme.shared.ctaBlue, borderColor: .white, borderWidth: 1))

        }
        .foregroundStyle(BasicTheme.shared.textBaseColor)
    }

    func graph() -> some View {
        GraduallyAppearingGraph(entries: [
            .init(percent: 0.2, caption: "現在", active: false),
            .init(percent: 0.4, caption: "３ヶ月", active: false),
            .init(percent: 0.7, caption: "1年", active: false),
            .init(percent: 1.0, caption: "2年", active: false),
        ], bar: {
            LinearGradient(
                colors: [
                    BasicTheme.shared.textGradientTop,BasicTheme.shared.textGradientBottom],
                startPoint: .top,
                endPoint: .bottom
            )
            .clipShape(
                .rect(topLeadingRadius: 3, topTrailingRadius: 3)
            )
        })
        .overlay(alignment: .topLeading, content: {
            Image(ImageResource.protty)
                .offset(CGSize(width: -40.0, height: -50.0))
        })
        .bold()
    }
}

#Preview {
    UpsellScreen()
}
