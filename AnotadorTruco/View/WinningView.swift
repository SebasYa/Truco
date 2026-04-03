import SwiftUI

struct WinningView: View {
    let onReset: () -> Void

    var body: some View {
        ResultView(
            title: "Ganaste!!",
            emoji: "😎",
            backgroundColor: .green,
            actionTitle: "Vuelve a Ganar! 😎",
            actionColor: .blue,
            onReset: onReset
        )
    }
}

#Preview {
    WinningView(onReset: {})
}
