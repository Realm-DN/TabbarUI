# SwiftUI TabBar Showcase

> 8 animated custom tab bar styles for iOS — with dark & light mode, spring transitions, and a live style picker. Single file, zero dependencies.

<p align="center">
  <!-- Replace the src below with your actual screenshot paths -->
  <img src="assets/preview-dark.png" width="48%" />
  &nbsp;
  <img src="assets/preview-light.png" width="48%" />
</p>

<p align="center">
  <img src="https://img.shields.io/badge/Swift-5.9-F05138?style=flat&logo=swift&logoColor=white" />
  <img src="https://img.shields.io/badge/iOS-16%2B-blue?style=flat&logo=apple&logoColor=white" />
  <img src="https://img.shields.io/badge/Xcode-15%2B-147EFB?style=flat&logo=xcode&logoColor=white" />
  <img src="https://img.shields.io/badge/License-MIT-green?style=flat" />
</p>

---

## Styles

<p align="center">
  <img src="assets/floating-pill.png" width="22%" />
  <img src="assets/glassy-blur.png" width="22%" />
  <img src="assets/neon-glow.png" width="22%" />
  <img src="assets/minimal-line.png" width="22%" />
</p>
<p align="center">
  <img src="assets/bouncy-icons.png" width="22%" />
  <img src="assets/notched-fab.png" width="22%" />
  <img src="assets/gradient-wave.png" width="22%" />
  <img src="assets/neumorphic.png" width="22%" />
</p>

| Style | Highlight |
|---|---|
| **Floating Pill** | Selected tab expands into a labeled capsule with a spring animation |
| **Glassy Blur** | `.ultraThinMaterial` surface with a sliding dot indicator via `matchedGeometryEffect` |
| **Neon Glow** | Dark canvas, green glow shadows that intensify on the active icon |
| **Minimal Line** | Hairline top indicator slides between tabs cleanly |
| **Bouncy Icons** | Active icon springs upward on tap using an interpolating spring |
| **Notched FAB** | 2 left · FAB center · 2 right — floating action button with ring border |
| **Gradient Wave** | Each tab tile has its own unique color gradient |
| **Neumorphic** | Soft inset/raised shadow that adapts correctly to both dark and light surfaces |

---

## Features

- 🌗 **Dark & light mode** — live toggle, every style adapts
- 🪄 **Spring transitions** — `.spring()` on all style and tab switches
- 🎯 **5-tab layout** — correct Notched FAB with 2-left · center · 2-right
- ✨ **`matchedGeometryEffect`** — smooth indicator animations on Glassy, Minimal, and Gradient styles
- 📦 **Single file** — just drop `ContentView.swift` into any project
- 🚫 **Zero dependencies** — pure SwiftUI, no packages required

---

## Requirements

| | Minimum |
|---|---|
| iOS | 16.0 |
| Xcode | 15.0 |
| Swift | 5.9 |

---

## Installation

**Option 1 — Copy the file**

1. Download or copy [`ContentView.swift`](ContentView.swift)
2. Drag it into your Xcode project
3. Run on simulator or device

**Option 2 — Clone the repo**

```bash
git clone https://github.com/YOUR_USERNAME/SwiftUI-TabBar-Showcase.git
cd SwiftUI-TabBar-Showcase
open SwiftUI-TabBar-Showcase.xcodeproj
```

---

## Usage

The app launches with the **Floating Pill** style selected.

| Action | How |
|---|---|
| Switch tab bar style | Tap **≡** (top right) → pick a style |
| Toggle dark / light mode | Tap **☀ / 🌙** (top right) |
| Change active tab | Tap any tab icon in the bar |

To use a single style in your own project, copy just the relevant struct — for example `NeonTabBar` — and bind it to your own `selectedTab` state.

```swift
@State private var selectedTab: Int = 0

NeonTabBar(selectedTab: $selectedTab, isDark: true)
```

Each tab bar takes two parameters:

| Parameter | Type | Description |
|---|---|---|
| `selectedTab` | `Binding<Int>` | Currently active tab index |
| `isDark` | `Bool` | Drives dark vs light color variants |

---

## Project Structure

```
SwiftUI-TabBar-Showcase/
├── ContentView.swift        # All 8 tab bar styles + showcase UI
├── README.md
└── assets/                  # Screenshots for this README
    ├── preview-dark.png
    ├── preview-light.png
    ├── floating-pill.png
    ├── glassy-blur.png
    ├── neon-glow.png
    ├── minimal-line.png
    ├── bouncy-icons.png
    ├── notched-fab.png
    ├── gradient-wave.png
    └── neumorphic.png
```

---

## Customisation

**Changing tab items** — edit the `tabs` array at the top of the file:

```swift
let tabs: [TabItem] = [
    TabItem(icon: "house.fill",       label: "Home"),
    TabItem(icon: "magnifyingglass",  label: "Search"),
    TabItem(icon: "plus.circle.fill", label: "Create"),
    TabItem(icon: "heart.fill",       label: "Likes"),
    TabItem(icon: "person.fill",      label: "Profile"),
]
```

**Changing accent colors** — each style uses hardcoded hex values for precision. Look for the relevant struct (e.g. `NeonTabBar`) and update the color:

```swift
// NeonTabBar
let neonColor = Color(hex: "00ff88")  // change to any hex

// BouncyTabBar
Color(hex: "f59e0b")  // amber accent
```

---

## Adding a New Style

1. Create a new `struct` conforming to the same signature:

```swift
struct MyCustomTabBar: View {
    @Binding var selectedTab: Int
    let isDark: Bool

    var body: some View {
        // your implementation
    }
}
```

2. Add a case to `TabBarStyle`:

```swift
case myCustom = "My Custom"
```

3. Add it to the `tabBarView` switch and the `styleIcon` switch in the enum.

---

## License

MIT — free to use in personal and commercial projects. Attribution appreciated but not required.

---

<p align="center">Made with SwiftUI · Contributions welcome</p>
