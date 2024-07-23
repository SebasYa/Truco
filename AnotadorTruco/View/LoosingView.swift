//
//  LoosingView.swift
//  AnotadorTruco
//
//  Created by Sebastian Yanni on 22/07/2024.
//

import SwiftUI
import SpriteKit

struct LoosingView: View {
    
    let anotador: AnotadorView
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [.red, .black], startPoint: .topLeading, endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
            VStack {
                Spacer()
                
                Text("Perdiste..")
                    .foregroundStyle(.white)
                    .font(.largeTitle)
                    .padding()
                Text("🥲")
                    .font(.largeTitle)
                    .padding()
                
                Spacer()
                
                
            }
            
            GeometryReader { geo in
                SpriteView(scene: ParticleSceneModel(size: geo.size), options: [.allowsTransparency])
                    .edgesIgnoringSafeArea(.all)

            }
            
            Spacer()
            
            Button(action: {
                anotador.ourPoints = 0
                anotador.theirPoints = 0
            }, label: {
                Text("Vuelve a intentarlo 😤")
                    .font(.title2)
                    .padding()
                    .background(Color.red)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            })
            .padding()
            .padding(.top, 700)
        }
        
        
    }
}

#Preview {
    LoosingView(anotador: AnotadorView(ourPoints: .constant(0), theirPoints: .constant(0)))
}
