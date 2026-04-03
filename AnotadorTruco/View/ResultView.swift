import SpriteKit
import SwiftUI

struct ResultView: View {
    @State private var isResetEnabled = false
    @State private var particleScene: ParticleScene?

    let title: String
    let emoji: String
    let backgroundColor: Color
    let actionTitle: String
    let actionColor: Color
    let onReset: () -> Void

    var body: some View {
        ZStack {
            LinearGradient(colors: [backgroundColor, .black], startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()

            VStack(alignment: .center) {
                Spacer()

                Text(title)
                    .foregroundStyle(.white)
                    .font(.largeTitle)
                    .padding()

                Text(emoji)
                    .font(.largeTitle)
                    .padding()

                Spacer()
            }

            GeometryReader { geometry in
                Group {
                    if let particleScene {
                        SpriteView(
                            scene: particleScene,
                            options: [.allowsTransparency]
                        )
                    } else {
                        Color.clear
                    }
                }
                .ignoresSafeArea()
                .allowsHitTesting(false)
                .task(id: geometry.size) {
                    updateParticleScene(for: geometry.size)
                }
            }

            VStack {
                Spacer()

                Button(action: onReset) {
                    Text(actionTitle)
                        .font(.title2)
                        .padding()
                        .background(actionColor.opacity(isResetEnabled ? 1 : 0.45))
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .disabled(!isResetEnabled)
                .padding()
            }
        }
        .task {
            isResetEnabled = false
            try? await Task.sleep(nanoseconds: 2_000_000_000)
            isResetEnabled = true
        }
        .onDisappear {
            particleScene = nil
            isResetEnabled = false
        }
    }

    private func updateParticleScene(for size: CGSize) {
        guard size.width > 1, size.height > 1 else {
            return
        }

        if particleScene?.size != size {
            particleScene = ParticleScene(size: size)
        }
    }
}

#Preview {
    ResultView(
        title: "Ganaste!!",
        emoji: "😎",
        backgroundColor: .green,
        actionTitle: "Vuelve a Ganar! 😎",
        actionColor: .blue,
        onReset: {}
    )
}
