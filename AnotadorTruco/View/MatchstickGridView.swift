//
//  MatchstickGridView.swift
//  AnotadorTruco
//
//  Created by Sebastian Yanni on 22/07/2024.
//

import SwiftUI

struct MatchstickGridView: View {
    let points: Int

    var body: some View {
        VStack {
            ForEach(0..<(points / 5 + (points % 5)), id: \.self) { index in
                if index == 3 && points > 15 {
                    Divider()
                        .frame(height: 2)
                        .background(Color.gray)
                        .padding(.vertical, 10)
                }
                MatchstickGroupViewModel(count: min(points - index * 5, 5))
                    .padding(5)
            }
        }
    }
}

#Preview {
    MatchstickGridView(points: 16)
}
