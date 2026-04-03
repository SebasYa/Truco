import SwiftUI

struct WinningView: View {
    let onReset: () -> Void

    var body: some View {
        ResultView(configuration: .winning, onReset: onReset)
    }
}

#Preview {
    WinningView(onReset: {})
}
