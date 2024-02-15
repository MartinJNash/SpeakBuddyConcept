import SwiftUI

// Makes a button with a background color, border color, and shadow
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
            .shadow(radius: 5)
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

    }
}
