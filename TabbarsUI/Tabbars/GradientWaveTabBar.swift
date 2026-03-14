//
//  GradientWaveTabBar.swift
//  TabbarsUI
//
//  Created by Dev Rana on 14/03/26.
//


import SwiftUI

// MARK: - 7. Gradient Wave
struct GradientWaveTabBar: View {
    @Binding var selectedTab: Int
    let isDark: Bool
    @Namespace private var ns

    let gradients: [LinearGradient] = [
        LinearGradient(colors: [Color(hex: "ff6b6b"), Color(hex: "feca57")], startPoint: .leading, endPoint: .trailing),
        LinearGradient(colors: [Color(hex: "48dbfb"), Color(hex: "ff9ff3")], startPoint: .leading, endPoint: .trailing),
        LinearGradient(colors: [Color(hex: "a29bfe"), Color(hex: "fd79a8")], startPoint: .leading, endPoint: .trailing),
        LinearGradient(colors: [Color(hex: "ff9f43"), Color(hex: "ee5a24")], startPoint: .leading, endPoint: .trailing),
        LinearGradient(colors: [Color(hex: "00d2d3"), Color(hex: "54a0ff")], startPoint: .leading, endPoint: .trailing),
    ]

    var body: some View {
        HStack(spacing: 0) {
            ForEach(0..<tabs.count, id: \.self) { i in
                Button(action: { selectedTab = i }) {
                    VStack(spacing: 5) {
                        ZStack {
                            if selectedTab == i {
                                RoundedRectangle(cornerRadius: 11)
                                    .fill(gradients[i])
                                    .frame(width: 40, height: 40)
                                    .matchedGeometryEffect(id: "gradBg\(i)", in: ns)
                            }
                            Image(systemName: tabs[i].icon)
                                .font(.system(size: 17, weight: .semibold))
                                .foregroundColor(
                                    selectedTab == i ? .white
                                    : (isDark ? .white.opacity(0.3) : Color(hex: "1a1a2e").opacity(0.3))
                                )
                                .frame(width: 40, height: 40)
                        }
                        Text(tabs[i].label)
                            .font(.system(size: 9, weight: .semibold))
                            .foregroundColor(
                                selectedTab == i
                                ? (isDark ? .white.opacity(0.9) : Color(hex: "1a1a2e").opacity(0.85))
                                : (isDark ? .white.opacity(0.28) : Color(hex: "1a1a2e").opacity(0.28))
                            )
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 7)
                }
                .animation(.spring(response: 0.38, dampingFraction: 0.72), value: selectedTab)
            }
        }
        .padding(.vertical, 4)
        .background(
            RoundedRectangle(cornerRadius: 24)
                .fill(isDark ? Color(hex: "160020").opacity(0.92) : Color.white.opacity(0.92))
                .overlay(RoundedRectangle(cornerRadius: 24).stroke(Color.primary.opacity(0.06), lineWidth: 1))
        )
        .shadow(color: .black.opacity(isDark ? 0.4 : 0.1), radius: 20, y: 6)
        .padding(.horizontal, 16)
    }
}