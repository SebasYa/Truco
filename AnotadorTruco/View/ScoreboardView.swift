import SwiftUI

struct ScoreboardView: View {
    @ObservedObject var viewModel: GameViewModel

    var body: some View {
        ZStack {
            LinearGradient(colors: [.blue, .black], startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()

            VStack {
                HStack {
                    Spacer()

                    Button(action: { viewModel.reset() }) {
                        Text("Reset")
                            .font(.subheadline)
                            .padding()
                            .background(Color.red)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    .padding(.trailing)
                }

                HStack(spacing: 0) {
                    teamHeader(title: Team.us.title, points: viewModel.ourPoints, horizontalOffset: -10)
                        .frame(maxWidth: .infinity)

                    teamHeader(title: Team.them.title, points: viewModel.theirPoints, horizontalOffset: 3)
                        .frame(maxWidth: .infinity)
                }
                .padding(.top, 15)

                Divider()
                    .background(.white)

                HStack(alignment: .top, spacing: 0) {
                    VStack {
                        MatchstickGridView(points: viewModel.ourPoints)
                            .padding(.trailing)
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)

                    Divider()
                        .background(.white)

                    VStack {
                        MatchstickGridView(points: viewModel.theirPoints)
                            .padding(.leading)
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                }
                .padding()

                Spacer()

                HStack {
                    TeamControlsView(
                        canRemove: viewModel.ourPoints > 0,
                        canAdd: viewModel.ourPoints < viewModel.maxScore,
                        onRemove: { viewModel.removePoint(from: .us) },
                        onAdd: { viewModel.addPoint(to: .us) }
                    )

                    Spacer()

                    TeamControlsView(
                        canRemove: viewModel.theirPoints > 0,
                        canAdd: viewModel.theirPoints < viewModel.maxScore,
                        onRemove: { viewModel.removePoint(from: .them) },
                        onAdd: { viewModel.addPoint(to: .them) }
                    )
                }
                .padding()
            }
        }
    }
}

#Preview {
    ScoreboardView(viewModel: GameViewModel(ourPoints: 12, theirPoints: 19))
}

private extension ScoreboardView {
    func teamHeader(title: String, points: Int, horizontalOffset: CGFloat) -> some View {
        VStack {
            Text(title)
                .font(.title2)
                .foregroundColor(.white)

            Text("\(points)")
                .font(.system(size: 34, weight: .bold, design: .rounded))
                .foregroundColor(.white)
        }
        .offset(x: horizontalOffset)
    }
}
