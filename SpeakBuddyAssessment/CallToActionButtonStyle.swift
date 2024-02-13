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
    Button(action: { print("Pressed") }) {
        Text("プランに登録する")
            .foregroundStyle(.white)
            .font(.title)
            .bold()
            .frame(maxWidth: .infinity)
    }
    .buttonStyle(CallToActionButtonStyle(backgroundColor: .cyan, borderColor: .orange, borderWidth: 5))
    .padding()
}
