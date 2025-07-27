import SwiftUI

struct Bubble: Identifiable {
    let id = UUID()
    var position: CGPoint
    let size: CGFloat
    let speed: CGFloat
    let color: Color
    
    init(screenWidth: CGFloat, speedMultiplier: CGFloat = 1.0) {
        // Random horizontal position
        self.position = CGPoint(
            x: CGFloat.random(in: 0...screenWidth),
            y: UIScreen.main.bounds.height + 50 // Start below screen
        )
        
        // Random size between 40-80 points for easy tapping
        self.size = CGFloat.random(in: 40...80)
        
        // Random speed with multiplier for difficulty progression
        let baseSpeed = CGFloat.random(in: 30...60)
        self.speed = baseSpeed * speedMultiplier
        
        // Random pastel colors
        let colors: [Color] = [
            .blue.opacity(0.7),
            .green.opacity(0.7),
            .purple.opacity(0.7),
            .pink.opacity(0.7),
            .orange.opacity(0.7),
            .cyan.opacity(0.7)
        ]
        self.color = colors.randomElement() ?? .blue.opacity(0.7)
    }
}