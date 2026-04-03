import SwiftUI

struct LosingView: View {
    let onReset: () -> Void

    var body: some View {
        ResultView(configuration: .losing, onReset: onReset)
    }
}

#Preview {
    LosingView(onReset: {})
}
