# ColorHelpers

A Swift package providing utility extensions for working with colors and RealityKit entities on iOS, visionOS, and macOS.

## Description

ColorHelpers is a collection of useful utilities for Apple platform development that simplifies common tasks when working with colors and RealityKit entities:

- **Hex Color Support**: Initialize SwiftUI `Color` and platform-specific colors from hex strings
- **Material Color Manipulation**: Easily change material colors on RealityKit entities
- **Grounding Shadows**: Add grounding shadow components to RealityKit entity hierarchies

The package is cross-platform compatible and works seamlessly across iOS 26+, visionOS 26+, and macOS 26+.

## Installation

Add ColorHelpers to your project using Swift Package Manager:

1. In Xcode, select **File > Add Package Dependencies...**
2. Enter the package repository URL
3. Select the version you want to use
4. Add the package to your target

Or add it to your `Package.swift` file:

```swift
dependencies: [
    .package(url: "https://github.com/yourusername/ColorHelpers.git", from: "1.0.0")
]
```

## Usage

### Hex Color Conversion

Convert hex color strings to SwiftUI `Color` or platform colors (`UIColor` on iOS/visionOS, `NSColor` on macOS).

```swift
import SwiftUI
import ColorHelpers

// Initialize a Color from hex string
let color1 = Color(hex: "FF5733")        // 6-digit RGB
let color2 = Color(hex: "#3498DB")       // With # prefix
let color3 = Color(hex: "F00")           // 3-digit shorthand
let color4 = Color(hex: "80FF5733")      // 8-digit ARGB with alpha

// Use in SwiftUI views
struct ContentView: View {
    var body: some View {
        Text("Hello, World!")
            .foregroundStyle(Color(hex: "FF5733") ?? .red)
    }
}

// Convert hex to platform color
let uiColor = uiColorFromHex(hex: "FF5733")  // Returns UIColor/NSColor
```

Supported hex formats:
- 3 digits: RGB (e.g., "F00" = #FF0000)
- 6 digits: RRGGBB (e.g., "FF5733")
- 8 digits: AARRGGBB (e.g., "80FF5733" with alpha)

### RealityKit Material Color Changes

Change the color of specific parts in a RealityKit entity hierarchy by name.

```swift
import RealityKit
import ColorHelpers

@MainActor
func customizeRobot(robot: Entity) {
    // Change multiple parts to the same color
    changeColorOf(
        parts: ["head", "body", "arms"],
        to: "3498DB",
        in: robot
    )
    
    // Change individual parts
    changeColorOf(
        parts: ["eyes"],
        to: "FF0000",
        in: robot
    )
}
```

This function:
- Searches for entities by name in the hierarchy
- Updates the base color tint of all PhysicallyBasedMaterial instances
- Works with both UIColor (iOS/visionOS) and NSColor (macOS)

### Grounding Shadows

Add grounding shadow components to all model entities in a hierarchy (available on macOS 15+, iOS 18+, visionOS 2+).

```swift
import RealityKit
import ColorHelpers

@MainActor
func addShadows(to entity: Entity) {
    entity.generateGroundingShadowComponents()
}
```

This extension:
- Automatically finds all `ModelEntity` objects in the hierarchy
- Assigns a `GroundingShadowComponent` to each one
- Note: Use sparingly as more than a dozen grounding shadows may impact performance

## Requirements

- iOS 26.0+
- visionOS 26.0+
- macOS 26.0+
- Swift 6.2+

## License

See LICENSE.txt for details.

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.
