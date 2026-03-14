//
//  NeonTabBar.swift
//  TabbarsUI
//
//  Created by Dev Rana on 14/03/26.
//


import SwiftUI

// MARK: - 3. Neon Glow
struct NeonTabBar: View {
    @Binding var selectedTab: Int
    let isDark: Bool
    let neonColor = Color(hex: "00ff88")

    var body: some View {
        HStack(spacing: 0) {
            ForEach(0..<tabs.count, id: \.self) { i in
                Button(action: { selectedTab = i }) {
                    VStack(spacing: 6) {
                        Image(systemName: tabs[i].icon)
                            .font(.system(size: 18, weight: .semibold))
                            .foregroundColor(
                                selectedTab == i ? neonColor
                                : (isDark ? .white.opacity(0.26) : Color(hex: "2a4a3a").opacity(0.35))
                            )
                            .shadow(color: selectedTab == i ? neonColor.opacity(0.95) : .clear, radius: 10)
                            .shadow(color: selectedTab == i ? neonColor.opacity(0.5) : .clear, radius: 22)
                        Rectangle()
                            .fill(selectedTab == i ? neonColor : Color.clear)
                            .frame(width: selectedTab == i ? 20 : 0, height: 2)
                            .shadow(color: selectedTab == i ? neonColor : .clear, radius: 6)
                            .cornerRadius(1)
                            .animation(.easeInOut(duration: 0.2), value: selectedTab)
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 13)
                }
                .animation(.easeInOut(duration: 0.2), value: selectedTab)
            }
        }
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(isDark ? Color(hex: "07070f") : Color(hex: "f0fff5"))
                .overlay(RoundedRectangle(cornerRadius: 20).stroke(neonColor.opacity(isDark ? 0.2 : 0.3), lineWidth: 1))
        )
        .shadow(color: neonColor.opacity(isDark ? 0.1 : 0.08), radius: 28, y: -2)
        .padding(.horizontal, 20)
    }
}