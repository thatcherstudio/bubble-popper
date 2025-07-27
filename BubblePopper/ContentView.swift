import SwiftUI

enum GameState {
    case playing
    case gameOver
}

struct ContentView: View {
    @State private var bubbles: [Bubble] = []
    @State private var bubbleTimer: Timer?
    @State private var animationTimer: Timer?
    @StateObject private var soundManager = SoundManager()
    @State private var bubblesPopped: Int = 0
    @State private var highScore: Int = UserDefaults.standard.integer(forKey: "highScore")
    @State private var showingInfo: Bool = false
    @State private var gameState: GameState = .playing
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                // Light pastel background
                Color(red: 0.94, green: 0.97, blue: 1.0)
                    .ignoresSafeArea()
                
                // Bubbles layer
                if gameState == .playing {
                    ForEach(bubbles) { bubble in
                        BubbleView(bubble: bubble) {
                            popBubble(bubble)
                        }
                    }
                }
                
                // Game Over Overlay
                if gameState == .gameOver {
                    VStack(spacing: 30) {
                        VStack(spacing: 15) {
                            Text("Game Over!")
                                .font(.largeTitle)
                                .fontWeight(.bold)
                                .foregroundColor(.primary)
                            
                            Text("\(bubblesPopped)")
                                .font(.system(size: 60))
                                .fontWeight(.heavy)
                                .foregroundColor(.blue)
                            
                            Text("Bubbles Popped")
                                .font(.title2)
                                .foregroundColor(.secondary)
                            
                            if bubblesPopped == highScore && bubblesPopped > 0 {
                                Text("🎉 New High Score! 🎉")
                                    .font(.title3)
                                    .fontWeight(.semibold)
                                    .foregroundColor(.orange)
                            }
                        }
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 20)
                                .fill(.ultraThinMaterial)
                                .shadow(radius: 10)
                        )
                        
                        Button(action: {
                            restartGame()
                        }) {
                            Text("Restart")
                                .font(.title)
                                .fontWeight(.semibold)
                                .foregroundColor(.white)
                                .padding(.horizontal, 40)
                                .padding(.vertical, 15)
                                .background(
                                    RoundedRectangle(cornerRadius: 15)
                                        .fill(.blue)
                                        .shadow(radius: 5)
                                )
                        }
                    }
                }
                
                // UI Overlay (only during gameplay)
                if gameState == .playing {
                    VStack {
                        ZStack {
                            // Centered counter
                            Text("\(bubblesPopped)")
                                .font(.largeTitle)
                                .fontWeight(.bold)
                                .foregroundColor(.primary)
                                .padding(.horizontal, 20)
                                .padding(.vertical, 10)
                                .background(
                                    RoundedRectangle(cornerRadius: 15)
                                        .fill(.ultraThinMaterial)
                                        .shadow(radius: 5)
                                )
                            
                            // Info button positioned absolutely
                            HStack {
                                Spacer()
                                Button(action: {
                                    showingInfo = true
                                }) {
                                    Image(systemName: "info.circle.fill")
                                        .font(.title2)
                                        .foregroundColor(.primary)
                                        .padding(12)
                                        .background(
                                            Circle()
                                                .fill(.ultraThinMaterial)
                                                .shadow(radius: 3)
                                        )
                                }
                                .padding(.trailing, 20)
                            }
                        }
                        .padding(.top, 10)
                        
                        Spacer()
                    }
                }
            }
            .onAppear {
                if gameState == .playing {
                    startBubbleGeneration(screenWidth: geometry.size.width)
                }
            }
            .onDisappear {
                stopBubbleGeneration()
            }
            .sheet(isPresented: $showingInfo) {
                InfoView(currentScore: bubblesPopped, highScore: highScore)
            }
        }
    }
    
    private func startBubbleGeneration(screenWidth: CGFloat) {
        guard gameState == .playing else { return }
        
        // Generate initial bubbles
        generateBubble(screenWidth: screenWidth)
        
        // Start timer for continuous generation
        bubbleTimer = Timer.scheduledTimer(withTimeInterval: 1.5, repeats: true) { _ in
            if self.gameState == .playing {
                self.generateBubble(screenWidth: screenWidth)
            }
        }
        
        // Start animation timer
        animationTimer = Timer.scheduledTimer(withTimeInterval: 0.016, repeats: true) { _ in
            if self.gameState == .playing {
                self.updateBubblePositions()
            }
        }
    }
    
    private func stopBubbleGeneration() {
        bubbleTimer?.invalidate()
        bubbleTimer = nil
        animationTimer?.invalidate()
        animationTimer = nil
    }
    
    private func generateBubble(screenWidth: CGFloat) {
        // Calculate speed multiplier based on bubbles popped
        // 3% increase every 10 bubbles (gentle progression for kids)
        let speedMultiplier = 1.0 + (CGFloat(bubblesPopped / 10) * 0.03)
        
        let newBubble = Bubble(screenWidth: screenWidth, speedMultiplier: speedMultiplier)
        bubbles.append(newBubble)
    }
    
    private func updateBubblePositions() {
        for i in bubbles.indices.reversed() {
            bubbles[i].position.y -= bubbles[i].speed * 0.016
            
            // Game over if bubble reaches top of screen
            if bubbles[i].position.y < -50 {
                gameOver()
                return
            }
        }
    }
    
    private func popBubble(_ bubble: Bubble) {
        guard gameState == .playing else { return }
        
        // Play pop sound
        soundManager.playPopSound()
        
        // Increment counter
        bubblesPopped += 1
        
        withAnimation(.easeOut(duration: 0.2)) {
            if let index = bubbles.firstIndex(where: { $0.id == bubble.id }) {
                bubbles.remove(at: index)
            }
        }
    }
    
    private func gameOver() {
        gameState = .gameOver
        stopBubbleGeneration()
        
        // Update high score if needed
        if bubblesPopped > highScore {
            highScore = bubblesPopped
            UserDefaults.standard.set(highScore, forKey: "highScore")
        }
    }
    
    private func restartGame() {
        gameState = .playing
        bubblesPopped = 0
        bubbles.removeAll()
        
        // Start a new game
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
               let window = windowScene.windows.first {
                let screenWidth = window.bounds.width
                self.startBubbleGeneration(screenWidth: screenWidth)
            }
        }
    }
}

#Preview {
    ContentView()
}