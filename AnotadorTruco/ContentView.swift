import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = GameViewModel()

    var body: some View {
        switch viewModel.gameState {
        case .playing:
            ScoreboardView(viewModel: viewModel)
        case .finished(let winner):
            switch winner {
            case .us:
                WinningView(onReset: { viewModel.reset() })
                    .id(viewModel.gameID)
            case .them:
                LosingView(onReset: { viewModel.reset() })
                    .id(viewModel.gameID)
            }
        }
    }
}

#Preview {
    ContentView()
}
