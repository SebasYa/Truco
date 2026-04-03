import SwiftUI

struct TeamControlsView: View {
    let canRemove: Bool
    let canAdd: Bool
    let onRemove: () -> Void
    let onAdd: () -> Void

    var body: some View {
        HStack {
            controlButton(
                systemName: "minus",
                isEnabled: canRemove,
                backgroundColor: .blue,
                foregroundColor: .white,
                action: onRemove
            )

            controlButton(
                systemName: "plus",
                isEnabled: canAdd,
                backgroundColor: .white,
                foregroundColor: .black,
                action: onAdd
            )
        }
    }

    private func controlButton(
        systemName: String,
        isEnabled: Bool,
        backgroundColor: Color,
        foregroundColor: Color,
        action: @escaping () -> Void
    ) -> some View {
        Button(action: action) {
            Image(systemName: systemName)
                .font(.title)
                .padding()
                .background(backgroundColor.opacity(isEnabled ? 1 : 0.35))
                .clipShape(Circle())
                .foregroundColor(foregroundColor.opacity(isEnabled ? 1 : 0.45))
        }
        .disabled(!isEnabled)
    }
}

#Preview {
    TeamControlsView(
        canRemove: true,
        canAdd: true,
        onRemove: {},
        onAdd: {}
    )
}
