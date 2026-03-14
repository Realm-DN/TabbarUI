//
//  NeumorphicTabBar.swift
//  TabbarsUI
//
//  Created by Dev Rana on 14/03/26.
//


import SwiftUI

// MARK: - 8. Neumorphic
struct NeumorphicTabBar: View {
    @Binding var selectedTab: Int
    let isDark: Bool

    var bgColor:     Color { isDark ? Color(hex: "1e2330") : Color(hex: "e8edf5") }
    var shadowDark:  Color { isDark ? Color.black.opacity(0.6) : Color(hex: "a0aec0").opacity(0.7) }
    var shadowLight: Color { isDark ? Color(hex: "2e3a52").opacity(0.85) : Color.white }
    var accentCol:   Color { Color(hex: "6c63ff") }
    var inactiveCol: Color { isDark ? Color(hex: "5a6a80") : Color(hex: "8896a5") }

    var body: some View {
        HStack(spacing: 0) {
            ForEach(0..<tabs.count, id: \.self) { i in
                Button(action: { selectedTab = i }) {
                    VStack(spacing: 5) {
                        Image(systemName: tabs[i].icon)
                            .font(.system(size: 17, weight: .semibold))
                            .foregroundColor(selectedTab == i ? accentCol : inactiveCol)
                            .frame(width: 38, height: 38)
                            .background(
                                ZStack {
                                    RoundedRectangle(cornerRadius: 12).fill(bgColor)
                                    if selectedTab == i {
                                        RoundedRectangle(cornerRadius: 12)
                                            .stroke(shadowDark, lineWidth: 1.5)
                                            .blur(radius: 1)
                                            .offset(x: 1, y: 1)
                                        RoundedRectangle(cornerRadius: 12)
                                            .stroke(shadowLight, lineWidth: 1.5)
                                            .blur(radius: 1)
                                            .offset(x: -1, y: -1)
                                    }
                                }
                                .shadow(color: shadowDark.opacity(selectedTab == i ? 0.7 : 0.5), radius: selectedTab == i ? 3 : 5, x: selectedTab == i ? 2 : 4, y: selectedTab == i ? 2 : 4)
                                .shadow(color: shadowLight.opacity(selectedTab == i ? 0.8 : 0.7), radius: selectedTab == i ? 3 : 5, x: selectedTab == i ? -2 : -4, y: selectedTab == i ? -2 : -4)
                            )
                        Text(tabs[i].label)
                            .font(.system(size: 9, weight: .medium))
                            .foregroundColor(selectedTab == i ? accentCol : inactiveCol)
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 10)
                }
                .animation(.easeInOut(duration: 0.18), value: selectedTab)
            }
        }
        .padding(.horizontal, 10)
        .padding(.vertical, 4)
        .background(
            RoundedRectangle(cornerRadius: 28)
                .fill(bgColor)
                .shadow(color: shadowDark, radius: 12, x: 6, y: 6)
                .shadow(color: shadowLight, radius: 12, x: -6, y: -6)
        )
        .padding(.horizontal, 20)
    }
}
