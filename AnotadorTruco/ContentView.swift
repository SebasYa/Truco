import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = GameViewModel()

    var body: some View {
        ZStack {
            ScoreboardView(viewModel: viewModel)
                .allowsHitTesting(viewModel.gameState == .playing)

            ResultView(
                configuration: resultConfiguration,
                onReset: { viewModel.reset() }
            )
            .zIndex(1)
        }
    }

    private var resultConfiguration: ResultView.Configuration? {
        switch viewModel.gameState {
        case .playing:
            return nil
        case .finished(winner: .us):
            return .winning
        case .finished(winner: .them):
            return .losing
        }
    }
}

#Preview {
    ContentView()
}
