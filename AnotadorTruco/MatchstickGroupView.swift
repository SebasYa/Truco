//
//  MatchstickGroupView.swift
//  AnotadorTruco
//
//  Created by Sebastian Yanni on 22/07/2024.
//

import SwiftUI

struct MatchstickGroupView: View {
    let count: Int

    var body: some View {
        ZStack {
            if count > 0 {
                MatchstickView(matchstick: Matchstick(isCenter: false))
                    .rotationEffect(.degrees(0))
                    .offset(x: -25, y: 0) // Vertical izquierdo
            }
            if count > 1 {
                MatchstickView(matchstick: Matchstick(isCenter: false))
                    .rotationEffect(.degrees(90))
                    .offset(x: 0, y: -25) // Horizontal top
            }
            if count > 2 {
                MatchstickView(matchstick: Matchstick(isCenter: false))
                    .rotationEffect(.degrees(0))
                    .offset(x: 25, y: 0) // Vertical derecho
            }
            if count > 3 {
                MatchstickView(matchstick: Matchstick(isCenter: false))
                    .rotationEffect(.degrees(90))
                    .offset(x: 0, y: 25) // Horizontal bottom
            }
            if count > 4 {
                MatchstickView(matchstick: Matchstick(isCenter: false))
                    .rotationEffect(.degrees(45))
                    .offset(x: 0, y: 0)
            }
        }
    }
}

#Preview {
    MatchstickGroupView(count: 5)
}
