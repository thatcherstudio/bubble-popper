# 🫧 Bubble Popper

A fun, simple bubble-popping game designed specifically for toddlers and young children (ages 1-6). Built with SwiftUI for iOS.

## 🎮 Game Features

- **Simple Gameplay**: Tap bubbles to pop them with satisfying sound effects
- **Progressive Difficulty**: Bubbles speed up every 10 pops (3% increase)
- **Game Over Mechanic**: Game ends when any bubble reaches the top
- **Score Tracking**: Current score display and persistent high score
- **Toddler-Friendly**: Large, colorful bubbles perfect for small fingers
- **No Ads**: Completely ad-free and safe for children
- **Offline Play**: No internet connection required

## 📱 Technical Details

- **Platform**: iOS 16.0+
- **Framework**: SwiftUI
- **Architecture**: MVVM pattern
- **Audio**: System sound effects (AVAudioServices)
- **Storage**: Local UserDefaults for high score only
- **Privacy**: Zero data collection, completely offline

## 🏗️ Project Structure

```
BubblePopper/
├── BubblePoppperApp.swift      # App entry point
├── ContentView.swift           # Main game view with state management
├── Bubble.swift               # Bubble data model
├── BubbleView.swift           # Individual bubble view component
├── SoundManager.swift         # Audio management
├── InfoView.swift             # About/info screen
├── Assets.xcassets/           # App icons and colors
├── Info.plist                # App configuration
└── Sounds/                    # Audio files directory

HTML/
├── index.html                 # Privacy policy website
├── bubble-popper-privacy.html # App-specific privacy policy
├── styles.css                # Website styling
└── README.md                 # Website documentation
```

## 🚀 Getting Started

### Prerequisites
- Xcode 15.0+
- iOS 16.0+ target device/simulator
- macOS for development

### Installation
1. Clone this repository
2. Open `BubblePopper.xcodeproj` in Xcode
3. Build and run on simulator or device

### Building for Release
1. Update version numbers in project settings
2. Generate app icons (already included)
3. Build for release configuration
4. Archive and upload to App Store Connect

## 🎨 Game Mechanics

### Bubble System
- Bubbles spawn randomly at bottom of screen
- Size: 40-80 points (optimized for toddler fingers)
- Colors: 6 pastel colors for visual appeal
- Animation: Smooth upward movement with physics

### Difficulty Progression
- Base speed: 30-60 points/second
- Every 10 bubbles popped: +3% speed increase
- Gentle progression suitable for young children

### Game States
- **Playing**: Active gameplay with bubble spawning
- **Game Over**: Score display with restart option

## 🔒 Privacy & Safety

- **Zero Data Collection**: No personal information collected
- **COPPA Compliant**: Safe for children under 13
- **Offline Operation**: No network requests during gameplay
- **Ad-Free**: No advertisements or external content
- **Parental Peace of Mind**: Complete privacy protection

## 📋 Roadmap (V2)

- [ ] Themed bubble packs (animals, shapes, holidays)
- [ ] In-app purchases for additional content
- [ ] Custom sound effects
- [ ] Haptic feedback
- [ ] Accessibility improvements
- [ ] Multiple difficulty modes

## 🏪 App Store

- **Category**: Games > Family
- **Age Rating**: 4+ (suitable for all ages)
- **Keywords**: bubble, toddler, kids, pop, game, children
- **Target Audience**: Parents with children ages 1-6

## 🛠️ Development

### Key Technologies
- SwiftUI for declarative UI
- Combine for reactive programming
- AVFoundation for audio
- UserDefaults for simple persistence

### Code Style
- Clean, readable Swift code
- Comprehensive comments for logic
- Modular component architecture
- Following iOS development best practices

## 📞 Support

For support or questions:
- **Email**: [Your email here]
- **Privacy Policy**: Available in HTML folder
- **Issues**: Use GitHub issues for bug reports

## 📄 License

[Your chosen license - e.g., MIT, Apache 2.0]

## 🙏 Acknowledgments

- Designed with toddler development in mind
- Inspired by classic bubble-popping games
- Built with ❤️ for families

---

**Made for little hands and big smiles! 🫧👶**