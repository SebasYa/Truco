//
//  ParticleSceneModel.swift
//  AnotadorTruco
//
//  Created by Sebastian Yanni on 22/07/2024.
//

import SwiftUI
import SpriteKit

class ParticleSceneModel : SKScene {
    
    override init(size: CGSize) {
        super.init(size: size)
        
        backgroundColor = .clear
        
        if let emitter1 = SKEmitterNode(fileNamed: "MyParticle") {
            emitter1.position.y = size.height
            emitter1.particleColorSequence = nil
            emitter1.particleColorBlendFactor = 1
            emitter1.particleColorBlueRange = 1
            emitter1.particleColorGreenRange = 1
            emitter1.particleColorRedRange = 1

            
            addChild(emitter1)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
