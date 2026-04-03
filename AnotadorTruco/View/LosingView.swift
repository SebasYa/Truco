import SwiftUI

struct LosingView: View {
    let onReset: () -> Void

    var body: some View {
        ResultView(
            title: "Perdiste..",
            emoji: "🥲",
            backgroundColor: .red,
            actionTitle: "Vuelve a intentarlo 😤",
            actionColor: .red,
            onReset: onReset
        )
    }
}

#Preview {
    LosingView(onReset: {})
}
