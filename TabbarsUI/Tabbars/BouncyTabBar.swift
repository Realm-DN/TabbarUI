//
//  BouncyTabBar.swift
//  TabbarsUI
//
//  Created by Dev Rana on 14/03/26.
//


import SwiftUI

// MARK: - 5. Bouncy Icons
struct BouncyTabBar: View {
    @Binding var selectedTab: Int
    let isDark: Bool
    @State private var bounceTab: Int? = nil

    var body: some View {
        HStack(spacing: 0) {
            ForEach(0..<tabs.count, id: \.self) { i in
                Button(action: {
                    bounceTab = i
                    selectedTab = i
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.45) { bounceTab = nil }
                }) {
                    VStack(spacing: 4) {
                        Image(systemName: tabs[i].icon)
                            .font(.system(size: 19, weight: .semibold))
                            .foregroundColor(
                                selectedTab == i ? Color(hex: "f59e0b")
                                : (isDark ? .white.opacity(0.3) : Color(hex: "1a1a2e").opacity(0.28))
                            )
                            .scaleEffect(bounceTab == i ? 1.4 : (selectedTab == i ? 1.08 : 1.0))
                            .offset(y: bounceTab == i ? -12 : 0)
                            .animation(.interpolatingSpring(stiffness: 320, damping: 10), value: bounceTab)
                        Circle()
                            .fill(selectedTab == i ? Color(hex: "f59e0b") : Color.clear)
                            .frame(width: 5, height: 5)
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 12)
                }
            }
        }
        .background(
            RoundedRectangle(cornerRadius: 24)
                .fill(isDark ? Color(hex: "232535") : Color.white)
                .shadow(color: .black.opacity(isDark ? 0.3 : 0.1), radius: 16, y: 4)
        )
        .padding(.horizontal, 20)
    }
}