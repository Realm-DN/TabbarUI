//
//  NotchedFabTabBar.swift
//  TabbarsUI
//
//  Created by Dev Rana on 14/03/26.
//


import SwiftUI

// MARK: - 6. Notched FAB  (2 left | FAB center | 2 right)
struct NotchedFabTabBar: View {
    @Binding var selectedTab: Int
    let isDark: Bool

    private let leftTabs  = [0, 1]
    private let rightTabs = [3, 4]
    private let fabIndex  = 2

    var body: some View {
        ZStack(alignment: .bottom) {
            // Bar
            HStack(spacing: 0) {
                ForEach(leftTabs, id: \.self) { i in
                    notchedTabButton(i)
                }
                Spacer().frame(width: 76)
                ForEach(rightTabs, id: \.self) { i in
                    notchedTabButton(i)
                }
            }
            .padding(.vertical, 10)
            .background(
                RoundedRectangle(cornerRadius: 26)
                    .fill(isDark ? Color(hex: "1e1e30") : Color.white)
                    .shadow(color: .black.opacity(isDark ? 0.28 : 0.1), radius: 18, y: -2)
            )

            // FAB
            Button(action: { selectedTab = fabIndex }) {
                Image(systemName: tabs[fabIndex].icon)
                    .font(.system(size: 22, weight: .bold))
                    .foregroundColor(.white)
                    .frame(width: 58, height: 58)
                    .background(
                        Circle().fill(
                            LinearGradient(
                                colors: [Color(hex: "7c6cf0"), Color(hex: "a78bfa")],
                                startPoint: .topLeading, endPoint: .bottomTrailing
                            )
                        )
                    )
                    .overlay(
                        Circle().stroke(isDark ? Color(hex: "1e1e30") : Color.white, lineWidth: 4)
                    )
                    .shadow(color: Color(hex: "7c6cf0").opacity(0.55), radius: 14, y: 4)
                    .scaleEffect(selectedTab == fabIndex ? 1.1 : 1.0)
                    .animation(.spring(response: 0.3, dampingFraction: 0.65), value: selectedTab)
            }
            .offset(y: -22)
        }
        .padding(.horizontal, 20)
        .animation(.spring(response: 0.3, dampingFraction: 0.7), value: selectedTab)
    }

    @ViewBuilder
    private func notchedTabButton(_ i: Int) -> some View {
        Button(action: { selectedTab = i }) {
            VStack(spacing: 3) {
                Image(systemName: tabs[i].icon)
                    .font(.system(size: 17, weight: selectedTab == i ? .bold : .regular))
                    .foregroundColor(
                        selectedTab == i ? Color(hex: "7c6cf0")
                        : (isDark ? .white.opacity(0.36) : Color(hex: "1a1a2e").opacity(0.36))
                    )
                Text(tabs[i].label)
                    .font(.system(size: 9, weight: .medium))
                    .foregroundColor(
                        selectedTab == i ? Color(hex: "7c6cf0")
                        : (isDark ? .white.opacity(0.36) : Color(hex: "1a1a2e").opacity(0.36))
                    )
            }
            .frame(maxWidth: .infinity)
        }
    }
}
