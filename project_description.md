# Project Description: Bubble Popper (iOS Toddler App)

## Overview

**Bubble Popper** is a simple iOS app designed for toddlers (ages 1–3). The concept is minimal: bubbles float around the screen, and toddlers tap them to pop. Each tap plays a satisfying "pop" sound. There's no scoring, no menus — just an engaging cause-and-effect experience.

## Goals

- Extremely simple UI
- Zero reading required
- Large, tappable interactive bubbles
- Minimal visual assets — all shapes can be programmatically generated
- Fun and responsive sound feedback

## Core Features

- Randomly generated bubbles that float from bottom to top of the screen
- Tap a bubble to pop it (disappear + sound effect)
- Gentle background color and looping ambient sound (optional toggle)
- Auto-reset or continuous generation so there’s no “game over”

## Technical Requirements

- Target: iPhone (iOS 16+)
- Language: Swift / SwiftUI
- Engine: Native UIKit or SwiftUI animation
- Assets: Use system colors and SF Symbols where possible. One "pop" sound file included.
- No login, no internet connection required
- No ads, no in-app purchases

## Development Instructions

1. **Scene Setup**
   - Full-screen SwiftUI or UIKit view
   - Light pastel background (e.g. #f0f8ff)

2. **Bubble Generation**
   - Create bubbles as circular `UIView`s or `SwiftUI Shapes`
   - Animate upward using timer or animation curve
   - Randomize bubble size, speed, and horizontal start position

3. **Tap Interaction**
   - On tap, play "pop" sound and remove bubble
   - (Optional) brief scale or fade animation when popped

4. **Sound**
   - Include one pop sound (e.g. `pop.wav`)
   - Background ambient loop can be toggled with a hidden gesture or switch

5. **Replayability**
   - Bubbles continuously spawn over time
   - Reset logic not required — just a continuous loop

## Version 1.0 Scope

- Single screen, no settings
- Works in both portrait and landscape
- No storage or user preferences

## Assets Needed

- 1 sound file: pop.wav
- Optional: ambient_background.wav

## Stretch Goals (Future Updates)

- Change bubble color per tap
- Add gentle music toggle
- Night mode (dark background)

## Notes for Claude

- Use SwiftUI unless UIKit is better for performance with animation
- Use `AVAudioPlayer` or similar to play sound
- Commit a new branch for each core feature (e.g. `feature/bubble-animation`, `feature/sound-effects`)
- Write internal comments to document logic, especially in animation and gesture handling
- Add README.md with build instructions and demo usage