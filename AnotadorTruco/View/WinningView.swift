//
//  WinningView.swift
//  AnotadorTruco
//
//  Created by Sebastian Yanni on 22/07/2024.
//

import SwiftUI
import SpriteKit

struct WinningView: View {
    
    let anotador: AnotadorView
    
    var body: some View {
        
        ZStack {
            LinearGradient(colors: [.green, .black], startPoint: .topLeading, endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
            
            VStack(alignment: .center) {
                Spacer()
                
                Text("Ganaste!!")
                    .foregroundStyle(.white)
                    .font(.largeTitle)
                    .padding()
                Text("😎")
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
                Text("Vuelve a Ganar! 😎")
                    .font(.title2)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            })
            .padding()
            .padding(.top, 700)
        }
  
    }
}




#Preview {
    WinningView(anotador: AnotadorView(ourPoints: .constant(0), theirPoints: .constant(0)))
}
