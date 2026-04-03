import SwiftUI

struct MatchstickGridView: View {
    let points: Int

    private var clampedPoints: Int {
        max(points, 0)
    }

    private var groupsCount: Int {
        (clampedPoints + 4) / 5
    }

    var body: some View {
        VStack {
            ForEach(0..<groupsCount, id: \.self) { index in
                if index == 3 && clampedPoints > 15 {
                    Divider()
                        .frame(height: 2)
                        .overlay(Color.white.opacity(0.25))
                        .padding(.vertical, 10)
                }

                MatchstickGroupView(count: max(0, min(clampedPoints - index * 5, 5)))
                    .padding(5)
            }
        }
        .frame(maxWidth: .infinity, alignment: .top)
    }
}

#Preview {
    MatchstickGridView(points: 16)
}
