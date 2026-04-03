import SwiftUI

struct MatchstickView: View {
    let rotation: Angle
    let animationValue: Int

    var body: some View {
        Image("Fosforo")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 30, height: 55)
            .rotationEffect(rotation)
            .transition(.scale.combined(with: .opacity))
            .animation(.easeInOut(duration: 0.2), value: animationValue)
    }
}

#Preview {
    VStack(spacing: 24) {
        MatchstickView(rotation: .degrees(0), animationValue: 3)
        MatchstickView(rotation: .degrees(45), animationValue: 5)
    }
}
