import Combine
import Foundation

@MainActor
final class GameViewModel: ObservableObject {
    @Published private(set) var ourPoints: Int
    @Published private(set) var theirPoints: Int

    let maxScore: Int

    init(ourPoints: Int = 0, theirPoints: Int = 0, maxScore: Int = 30) {
        self.maxScore = maxScore
        self.ourPoints = min(max(ourPoints, 0), maxScore)
        self.theirPoints = min(max(theirPoints, 0), maxScore)
    }

    var gameState: GameState {
        GameState(ourPoints: ourPoints, theirPoints: theirPoints, maxScore: maxScore)
    }

    func reset() {
        ourPoints = 0
        theirPoints = 0
    }

    func addPoint(to team: Team) {
        guard gameState == .playing else {
            return
        }

        switch team {
        case .us:
            ourPoints = min(ourPoints + 1, maxScore)
        case .them:
            theirPoints = min(theirPoints + 1, maxScore)
        }
    }

    func removePoint(from team: Team) {
        switch team {
        case .us:
            ourPoints = max(ourPoints - 1, 0)
        case .them:
            theirPoints = max(theirPoints - 1, 0)
        }
    }
}
