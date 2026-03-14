import SwiftUI

// MARK: - Main Content View
struct ContentView: View {
    @State private var selectedStyle: TabBarStyle = .floating
    @State private var selectedTab: Int = 0
    @State private var showStylePicker = false
    @State private var isDarkMode: Bool = true

    var isDark: Bool { isDarkMode }

    var body: some View {
        ZStack(alignment: .bottom) {
            backgroundView
                .ignoresSafeArea()

            VStack(spacing: 0) {
                // Top bar
                HStack {
                    VStack(alignment: .leading, spacing: 2) {
                        Text("TabBar Showcase")
                            .font(.title2.bold())
                            .foregroundColor(isDark ? .white : Color(hex: "1a1a2e"))
                        Text(selectedStyle.rawValue)
                            .font(.caption)
                            .foregroundColor(isDark ? .white.opacity(0.55) : Color(hex: "1a1a2e").opacity(0.5))
                    }
                    Spacer()

                    // Dark/Light toggle
                    Button(action: {
                        withAnimation(.spring(response: 0.4, dampingFraction: 0.75)) {
                            isDarkMode.toggle()
                        }
                    }) {
                        Image(systemName: isDarkMode ? "sun.max.fill" : "moon.fill")
                            .font(.system(size: 15, weight: .semibold))
                            .foregroundColor(isDark ? .white : Color(hex: "1a1a2e"))
                            .padding(10)
                            .background(
                                RoundedRectangle(cornerRadius: 12)
                                    .fill(isDark ? Color.white.opacity(0.15) : Color(hex: "1a1a2e").opacity(0.08))
                            )
                    }
                    .padding(.trailing, 8)

                    // Style picker button
                    Button(action: { withAnimation(.spring()) { showStylePicker.toggle() } }) {
                        Image(systemName: "slider.horizontal.3")
                            .font(.system(size: 15, weight: .semibold))
                            .foregroundColor(isDark ? .white : Color(hex: "1a1a2e"))
                            .padding(10)
                            .background(
                                RoundedRectangle(cornerRadius: 12)
                                    .fill(isDark ? Color.white.opacity(0.15) : Color(hex: "1a1a2e").opacity(0.08))
                            )
                    }
                }
                .padding(.horizontal, 20)
                .padding(.top, 16)

                tabContent
                    .frame(maxWidth: .infinity, maxHeight: .infinity)

                Color.clear.frame(height: 110)
            }

            if showStylePicker {
                StylePickerView(selectedStyle: $selectedStyle, isShowing: $showStylePicker, isDark: isDark)
                    .transition(.move(edge: .bottom).combined(with: .opacity))
                    .zIndex(10)
            }

            tabBarView
                .padding(.bottom, 28)
        }
        .preferredColorScheme(isDarkMode ? .dark : .light)
        .animation(.spring(response: 0.4, dampingFraction: 0.75), value: selectedStyle)
        .animation(.spring(response: 0.4, dampingFraction: 0.75), value: selectedTab)
        .animation(.spring(response: 0.4, dampingFraction: 0.8), value: isDarkMode)
    }

    // MARK: - Background
    @ViewBuilder
    var backgroundView: some View {
        switch selectedStyle {
        case .neon:
            LinearGradient(
                colors: isDark ? [Color(hex: "060614"), Color(hex: "0b0b22")] : [Color(hex: "e8f5e9"), Color(hex: "c8e6c9")],
                startPoint: .top, endPoint: .bottom)
        case .glassy:
            LinearGradient(
                colors: isDark ? [Color(hex: "1a1a2e"), Color(hex: "16213e")] : [Color(hex: "dde8f5"), Color(hex: "c5d8f0")],
                startPoint: .top, endPoint: .bottom)
        case .neumorphic:
            LinearGradient(
                colors: isDark ? [Color(hex: "1e2330"), Color(hex: "171c28")] : [Color(hex: "e8edf5"), Color(hex: "d0d9e8")],
                startPoint: .top, endPoint: .bottom)
        case .gradient:
            LinearGradient(
                colors: isDark ? [Color(hex: "280026"), Color(hex: "0b6870")] : [Color(hex: "f8e5ff"), Color(hex: "c3f0f5")],
                startPoint: .topLeading, endPoint: .bottomTrailing)
        default:
            LinearGradient(
                colors: isDark ? [Color(hex: "1c1c2e"), Color(hex: "2a2a40")] : [Color(hex: "f0f0f8"), Color(hex: "e2e2f0")],
                startPoint: .top, endPoint: .bottom)
        }
    }

    // MARK: - Tab Content
    var tabContent: some View {
        VStack(spacing: 16) {
            Spacer()
            ZStack {
                Circle()
                    .fill(accentColor.opacity(isDark ? 0.12 : 0.1))
                    .frame(width: 110, height: 110)
                Image(systemName: tabs[selectedTab].icon)
                    .font(.system(size: 52, weight: .light))
                    .foregroundStyle(accentColor)
                    .symbolEffect(.pulse)
            }
            Text(tabs[selectedTab].label)
                .font(.title.bold())
                .foregroundColor(isDark ? .white : Color(hex: "1a1a2e"))
            Text("Tap ≡ to switch styles  ·  ☀/🌙 for theme")
                .font(.caption)
                .foregroundColor(isDark ? .white.opacity(0.35) : Color(hex: "1a1a2e").opacity(0.4))
                .multilineTextAlignment(.center)
            Spacer()
        }
        .id("\(selectedStyle)-\(isDarkMode)")
        .transition(.opacity)
    }

    var accentColor: Color {
        switch selectedStyle {
        case .neon:       return Color(hex: "00ff88")
        case .gradient:   return Color(hex: "ff6b6b")
        case .neumorphic: return Color(hex: "6c63ff")
        case .bouncy:     return Color(hex: "f59e0b")
        default:          return Color(hex: "7c6cf0")
        }
    }

    // MARK: - Tab Bar Router
    @ViewBuilder
    var tabBarView: some View {
        switch selectedStyle {
        case .floating:   FloatingPillTabBar(selectedTab: $selectedTab, isDark: isDark)
        case .glassy:     GlassyTabBar(selectedTab: $selectedTab, isDark: isDark)
        case .neon:       NeonTabBar(selectedTab: $selectedTab, isDark: isDark)
        case .minimal:    MinimalLineTabBar(selectedTab: $selectedTab, isDark: isDark)
        case .bouncy:     BouncyTabBar(selectedTab: $selectedTab, isDark: isDark)
        case .notched:    NotchedFabTabBar(selectedTab: $selectedTab, isDark: isDark)
        case .gradient:   GradientWaveTabBar(selectedTab: $selectedTab, isDark: isDark)
        case .neumorphic: NeumorphicTabBar(selectedTab: $selectedTab, isDark: isDark)
        }
    }
}

#Preview {
    ContentView()
}
