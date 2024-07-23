//
//  Matchstick.swift
//  AnotadorTruco
//
//  Created by Sebastian Yanni on 22/07/2024.
//

import SwiftUI

struct MatchstickView: View {
    let matchstick: Matchstick

    var body: some View {
        Image("Fosforo")
            .resizable()
            .frame(width: matchstick.isCenter ? 30 : 30, height: 55)
            .rotationEffect(.degrees(matchstick.isCenter ? 45 : 0))
            .transition(.scale)
            .animation(.easeInOut, value: matchstick)
    }
}

#Preview {
    MatchstickView(matchstick: Matchstick(isCenter: true))
}
