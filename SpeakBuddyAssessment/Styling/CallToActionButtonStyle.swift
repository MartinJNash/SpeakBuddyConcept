import SwiftUI

struct CallToActionButtonStyle: ButtonStyle {

    let backgroundColor: Color
    let borderColor: Color
    let borderWidth: CGFloat

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(backgroundColor, in: Capsule())
            .overlay {
                Capsule()
                    .stroke(borderColor, lineWidth: borderWidth)
            }
    }
}

#Preview {
    let button = Button(action: { print("Pressed") }) {
        Text("プランに登録する")
            .foregroundStyle(.white)
            .font(.title)
            .bold()
            .frame(maxWidth: .infinity)
        }
        .padding()

    return Group {
        button
            .buttonStyle(CallToActionButtonStyle(backgroundColor: .cyan, borderColor: .orange, borderWidth: 5))

        button
            .buttonStyle(CallToActionButtonStyle(backgroundColor: .purple, borderColor: .white, borderWidth: 5))
            .shadow(radius: 5)

    }
}
