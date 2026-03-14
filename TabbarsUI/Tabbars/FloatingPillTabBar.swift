//
//  FloatingPillTabBar.swift
//  TabbarsUI
//
//  Created by Dev Rana on 14/03/26.
//


import SwiftUI

// MARK: - 1. Floating Pill
struct FloatingPillTabBar: View {
    @Binding var selectedTab: Int
    let isDark: Bool

    var body: some View {
        HStack(spacing: 4) {
            ForEach(0..<tabs.count, id: \.self) { i in
                Button(action: { selectedTab = i }) {
                    HStack(spacing: selectedTab == i ? 6 : 0) {
                        Image(systemName: tabs[i].icon)
                            .font(.system(size: 15, weight: .semibold))
                        if selectedTab == i {
                            Text(tabs[i].label)
                                .font(.caption.bold())
                                .transition(.opacity.combined(with: .scale(scale: 0.8)))
                        }
                    }
                    .foregroundColor(
                        selectedTab == i ? .white
                        : (isDark ? .white.opacity(0.4) : Color(hex: "1a1a2e").opacity(0.38))
                    )
                    .padding(.vertical, 10)
                    .padding(.horizontal, selectedTab == i ? 14 : 11)
                    .background(
                        Capsule().fill(selectedTab == i ? Color(hex: "7c6cf0") : Color.clear)
                    )
                }
                .animation(.spring(response: 0.32, dampingFraction: 0.68), value: selectedTab)
            }
        }
        .padding(5)
        .background(
            Capsule()
                .fill(isDark ? Color(hex: "232338") : Color.white)
                .shadow(color: .black.opacity(isDark ? 0.35 : 0.12), radius: 20, y: 6)
        )
    }
}