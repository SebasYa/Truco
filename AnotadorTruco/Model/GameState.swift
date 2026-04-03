enum GameState: Equatable {
    case playing
    case finished(winner: Team)

    init(ourPoints: Int, theirPoints: Int, maxScore: Int) {
        if ourPoints >= maxScore {
            self = .finished(winner: .us)
        } else if theirPoints >= maxScore {
            self = .finished(winner: .them)
        } else {
            self = .playing
        }
    }
}
