import SwiftUI

struct MatchstickGroupView: View {
    let count: Int

    private var safeCount: Int {
        max(0, min(count, 5))
    }

    var body: some View {
        ZStack {
            if safeCount > 0 {
                MatchstickView(rotation: .degrees(0), animationValue: safeCount)
                    .offset(x: -25, y: 0)
            }
            if safeCount > 1 {
                MatchstickView(rotation: .degrees(90), animationValue: safeCount)
                    .offset(x: 0, y: -25)
            }
            if safeCount > 2 {
                MatchstickView(rotation: .degrees(0), animationValue: safeCount)
                    .offset(x: 25, y: 0)
            }
            if safeCount > 3 {
                MatchstickView(rotation: .degrees(90), animationValue: safeCount)
                    .offset(x: 0, y: 25)
            }
            if safeCount > 4 {
                MatchstickView(rotation: .degrees(45), animationValue: safeCount)
            }
        }
    }
}

#Preview {
    MatchstickGroupView(count: 5)
}
