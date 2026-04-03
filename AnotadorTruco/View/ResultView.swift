import SpriteKit
import SwiftUI

struct ResultView: View {
    struct Configuration {
        let title: String
        let emoji: String
        let backgroundColor: Color
        let actionTitle: String
        let actionColor: Color

        static let winning = Self(
            title: "Ganaste!!",
            emoji: "😎",
            backgroundColor: .green,
            actionTitle: "Vuelve a Ganar! 😎",
            actionColor: .blue
        )

        static let losing = Self(
            title: "Perdiste..",
            emoji: "🥲",
            backgroundColor: .red,
            actionTitle: "Vuelve a intentarlo 😤",
            actionColor: .red
        )

        static let hidden = Self(
            title: "",
            emoji: "",
            backgroundColor: .clear,
            actionTitle: "",
            actionColor: .clear
        )
    }

    @State private var isResetEnabled = false
    @State private var particleScene: ParticleScene

    let configuration: Configuration?
    let onReset: () -> Void

    private var resolvedConfiguration: Configuration {
        configuration ?? .hidden
    }

    private var isVisible: Bool {
        configuration != nil
    }

    init(configuration: Configuration?, onReset: @escaping () -> Void) {
        self.configuration = configuration
        self.onReset = onReset
        let initialSize = UIScreen.main.bounds.size
        _particleScene = State(initialValue: ParticleScene(size: initialSize))
    }

    var body: some View {
        ZStack {
            LinearGradient(
                colors: [resolvedConfiguration.backgroundColor, .black],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()

            VStack(alignment: .center) {
                Spacer()

                Text(resolvedConfiguration.title)
                    .foregroundStyle(.white)
                    .font(.largeTitle)
                    .padding()

                Text(resolvedConfiguration.emoji)
                    .font(.largeTitle)
                    .padding()

                Spacer()
            }

            GeometryReader { geometry in
                ParticleBackgroundView(
                    scene: particleScene,
                    size: geometry.size,
                    isActive: isVisible
                )
                .ignoresSafeArea()
                .allowsHitTesting(false)
            }

            VStack {
                Spacer()

                Button(action: onReset) {
                    Text(resolvedConfiguration.actionTitle)
                        .font(.title2)
                        .padding()
                        .background(resolvedConfiguration.actionColor.opacity(isResetEnabled ? 1 : 0.45))
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .disabled(!isResetEnabled)
                .padding()
            }
        }
        .opacity(isVisible ? 1 : 0)
        .allowsHitTesting(isVisible)
        .task(id: isVisible) {
            isResetEnabled = false

            guard isVisible else {
                return
            }

            do {
                try await Task.sleep(nanoseconds: 2_000_000_000)
            } catch {
                return
            }

            isResetEnabled = true
        }
        .onDisappear {
            isResetEnabled = false
        }
    }
}

private struct ParticleBackgroundView: UIViewRepresentable {
    final class Coordinator {
        var lastSize: CGSize = .zero
        var wasActive = false
    }

    let scene: ParticleScene
    let size: CGSize
    let isActive: Bool

    func makeCoordinator() -> Coordinator {
        Coordinator()
    }

    func makeUIView(context: Context) -> SKView {
        let view = SKView()
        configure(view)

        context.coordinator.lastSize = size
        context.coordinator.wasActive = isActive

        if size.width > 1, size.height > 1 {
            scene.updateLayout(size: size)

            if isActive {
                scene.prepareForPresentation(size: size)
            }
        }

        scene.isPaused = !isActive
        view.isPaused = !isActive
        view.presentScene(scene)
        return view
    }

    func updateUIView(_ view: SKView, context: Context) {
        configure(view)

        guard size.width > 1, size.height > 1 else {
            return
        }

        if context.coordinator.lastSize != size {
            scene.updateLayout(size: size)
            context.coordinator.lastSize = size
        }

        if view.scene !== scene {
            view.presentScene(scene)
        }

        if context.coordinator.wasActive != isActive {
            if isActive {
                scene.isPaused = false
                scene.prepareForPresentation(size: size)
                view.isPaused = false
            } else {
                view.isPaused = true
                scene.isPaused = true
            }

            context.coordinator.wasActive = isActive
        }
    }

    static func dismantleUIView(_ view: SKView, coordinator: Coordinator) {
        view.presentScene(nil)
    }

    private func configure(_ view: SKView) {
        view.allowsTransparency = true
        view.backgroundColor = .clear
        view.isOpaque = false
    }
}

#Preview {
    ResultView(configuration: .winning, onReset: {})
}
