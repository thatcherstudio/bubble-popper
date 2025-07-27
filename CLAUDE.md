# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

**Bubble Popper** is a minimal iOS app for toddlers (ages 1-3). The app displays floating bubbles that toddlers can tap to pop with sound effects. This is a greenfield project that needs to be built from scratch.

## Development Setup

This project has not been initialized yet. To set up the iOS project:

1. Create a new iOS project in Xcode targeting iOS 16+
2. Use SwiftUI as the primary framework (unless UIKit is needed for performance)
3. Configure the project for iPhone target

## Architecture Guidelines

### Core Components to Implement

- **Main View**: Full-screen SwiftUI view with light pastel background (#f0f8ff)
- **Bubble System**: Circular shapes that animate upward from bottom to top
- **Audio System**: Uses AVAudioPlayer for pop sounds and optional ambient background
- **Animation Engine**: Native SwiftUI or UIKit animations for bubble movement and pop effects

### Key Implementation Details

- Bubbles spawn continuously with randomized size, speed, and horizontal position
- Tap gesture handling removes bubbles and plays sound
- No menus, scoring, or game over states - pure cause-and-effect interaction
- Support both portrait and landscape orientations
- No network connectivity, user accounts, or data persistence required

## Development Workflow

### Branching Strategy
- Create feature branches for each core component:
  - `feature/bubble-animation`
  - `feature/sound-effects` 
  - `feature/tap-interaction`

### Assets Required
- `pop.wav` - primary sound effect for bubble popping
- `ambient_background.wav` - optional looping background audio

## Technical Constraints

- Target iOS 16+ minimum
- Use Swift/SwiftUI
- Leverage system colors and SF Symbols where possible
- No external dependencies or frameworks needed
- No ads, in-app purchases, or monetization features

## Future Enhancements

Planned stretch goals include color-changing bubbles, music toggle, and night mode with dark background.