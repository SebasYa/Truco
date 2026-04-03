enum Team: Equatable {
    case us
    case them

    var title: String {
        switch self {
        case .us:
            return "Nosotros"
        case .them:
            return "Ellos"
        }
    }
}
