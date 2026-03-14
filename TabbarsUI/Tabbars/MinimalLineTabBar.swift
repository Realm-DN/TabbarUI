//
//  MinimalLineTabBar.swift
//  TabbarsUI
//
//  Created by Dev Rana on 14/03/26.
//


import SwiftUI

// MARK: - 4. Minimal Line
struct MinimalLineTabBar: View {
    @Binding var selectedTab: Int
    let isDark: Bool
    @Namespace private var ns

    var body: some View {
        HStack(spacing: 0) {
            ForEach(0..<tabs.count, id: \.self) { i in
                Button(action: { selectedTab = i }) {
                    VStack(spacing: 8) {
                        if selectedTab == i {
                            Rectangle()
                                .fill(isDark ? Color.white : Color(hex: "1a1a2e"))
                                .frame(height: 2)
                                .matchedGeometryEffect(id: "minLine", in: ns)
                        } else {
                            Rectangle().fill(Color.clear).frame(height: 2)
                        }
                        Image(systemName: tabs[i].icon)
                            .font(.system(size: 17))
                            .foregroundColor(
                                selectedTab == i
                                ? (isDark ? .white : Color(hex: "1a1a2e"))
                                : (isDark ? .white.opacity(0.3) : Color(hex: "1a1a2e").opacity(0.3))
                            )
                        Text(tabs[i].label)
                            .font(.system(size: 9, weight: .medium))
                            .foregroundColor(
                                selectedTab == i
                                ? (isDark ? .white : Color(hex: "1a1a2e"))
                                : (isDark ? .white.opacity(0.3) : Color(hex: "1a1a2e").opacity(0.3))
                            )
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 6)
                }
                .animation(.spring(response: 0.35, dampingFraction: 0.8), value: selectedTab)
            }
        }
        .padding(.horizontal, 12)
    }
}