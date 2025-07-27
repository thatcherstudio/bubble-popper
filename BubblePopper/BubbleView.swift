import SwiftUI

struct BubbleView: View {
    let bubble: Bubble
    let onTap: () -> Void
    
    var body: some View {
        Circle()
            .fill(
                RadialGradient(
                    gradient: Gradient(colors: [
                        bubble.color.opacity(0.8),
                        bubble.color.opacity(0.3)
                    ]),
                    center: UnitPoint(x: 0.3, y: 0.3),
                    startRadius: 5,
                    endRadius: bubble.size / 2
                )
            )
            .frame(width: bubble.size, height: bubble.size)
            .overlay(
                Circle()
                    .stroke(bubble.color.opacity(0.5), lineWidth: 2)
            )
            .position(bubble.position)
            .onTapGesture {
                onTap()
            }
    }
}