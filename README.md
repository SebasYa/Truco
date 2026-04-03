# Truco - Scorekeeper

<div align="center">
<img src="https://github.com/SebasYa/Truco/blob/main/AnotadorTruco/Assets.xcassets/AppIcon.appiconset/Truco%20ImagenApp.png" alt="App Icon" width="300">
</div>

- ![Swift](https://img.shields.io/badge/Swift-FA7343?style=for-the-badge&logo=swift&logoColor=white&style=flat)
- ![SwiftUI](https://img.shields.io/badge/SwiftUI-000000?style=for-the-badge&logo=swift&logoColor=white&style=flat)
- ![Xcode](https://img.shields.io/badge/Xcode-1575F9?style=for-the-badge&logo=xcode&logoColor=white&style=flat)
- ![SpriteKit](https://img.shields.io/badge/SpriteKit-blue?style=for-the-badge&logo=apple&logoColor=white&style=flat)

## Description

Truco is an iOS scorekeeper for the Argentinian card game. The app focuses on one job: keeping the score clearly and quickly during a match.

<img src="https://github.com/SebasYa/Truco/blob/main/GifTruco%20.gif" alt="App Demo" width="250"/>

## Current Features

- Track points for both teams up to 30 points.
- Show the current total score for each team.
- Visualize points with grouped matchsticks.
- Reset the game at any time.
- Show a result screen with particle effects when the match ends.

## Architecture

The app now uses a lightweight MVVM structure:

```text
AnotadorTruco/
  AnotadorTrucoApp.swift
  ContentView.swift
  View/
    ScoreboardView.swift
    MatchstickGridView.swift
    MatchstickGroupView.swift
    MatchstickView.swift
    TeamControlsView.swift
    ResultView.swift
    WinningView.swift
    LosingView.swift
  ViewModel/
    GameViewModel.swift
  Model/
    GameState.swift
    Team.swift
  Effects/
    ParticleScene.swift
```

## Installation

1. Clone the repository:

```bash
git clone https://github.com/SebasYa/Truco.git
```

2. Open the project in Xcode:

```bash
open AnotadorTruco.xcodeproj
```

3. Select an iPhone simulator or device and run the app.

## Usage

1. Start a new match from the main scoreboard.
2. Use the `+` and `-` controls for each team.
3. Reset the game whenever you want.
4. When one team reaches 30 points, the app shows the corresponding result screen.

## Contribution

Contributions are welcome. If you want to collaborate:

1. Fork the repository.
2. Create a branch for your change.
3. Make your edits and verify the app builds.
4. Open a pull request with a short description of the change.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for more information.
