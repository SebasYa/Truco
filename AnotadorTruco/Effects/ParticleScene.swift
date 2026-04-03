import SpriteKit

final class ParticleScene: SKScene {
    private var emitter: SKEmitterNode?

    override init(size: CGSize) {
        super.init(size: size)
        scaleMode = .resizeFill
        backgroundColor = .clear
    }

    override func didMove(to view: SKView) {
        super.didMove(to: view)

        if emitter == nil {
            emitter = makeEmitter()
        }

        guard let emitter else {
            return
        }

        if emitter.parent == nil {
            addChild(emitter)
        }

        configure(emitter: emitter, for: size)
        emitter.resetSimulation()
        emitter.advanceSimulationTime(4)
    }

    override func didChangeSize(_ oldSize: CGSize) {
        super.didChangeSize(oldSize)

        guard let emitter else {
            return
        }

        configure(emitter: emitter, for: size)
    }

    override func willMove(from view: SKView) {
        super.willMove(from: view)
        emitter?.removeFromParent()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func makeEmitter() -> SKEmitterNode? {
        guard let emitter = SKEmitterNode(fileNamed: "MyParticle") else {
            return nil
        }

        emitter.particleColorSequence = nil
        emitter.particleColorBlendFactor = 1
        emitter.particleColorBlueRange = 1
        emitter.particleColorGreenRange = 1
        emitter.particleColorRedRange = 1
        return emitter
    }

    private func configure(emitter: SKEmitterNode, for size: CGSize) {
        emitter.position = CGPoint(x: size.width / 2, y: size.height + 120)
        emitter.particlePositionRange = CGVector(dx: size.width + 120, dy: 0)
    }
}
