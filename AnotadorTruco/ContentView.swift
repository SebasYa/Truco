//
//  ContentView.swift
//  AnotadorTruco
//
//  Created by Sebastian Yanni on 22/07/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var ourPoints = 0
    @State private var theirPoints = 0
    
    var body: some View {
            VStack {
                if ourPoints >= 30 {
                    WinningView(anotador: AnotadorView(ourPoints: $ourPoints, theirPoints: $theirPoints))
                } else if theirPoints >= 30 {
                    LoosingView(anotador: AnotadorView(ourPoints: $ourPoints, theirPoints: $theirPoints))
                } else {
                    AnotadorView(ourPoints: $ourPoints, theirPoints: $theirPoints)
                }
            }
        }
}

#Preview {
    ContentView()
}
