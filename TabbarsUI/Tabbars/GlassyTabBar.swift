//
//  GlassyTabBar.swift
//  TabbarsUI
//
//  Created by Dev Rana on 14/03/26.
//


import SwiftUI

// MARK: - 2. Glassy Blur
struct GlassyTabBar: View {
    @Binding var selectedTab: Int
    let isDark: Bool
    @Namespace private var ns

    var body: some View {
        HStack(spacing: 0) {
            ForEach(0..<tabs.count, id: \.self) { i in
                Button(action: { selectedTab = i }) {
                    VStack(spacing: 5) {
                        Image(systemName: tabs[i].icon)
                            .font(.system(size: 17, weight: selectedTab == i ? .bold : .regular))
                            .foregroundColor(
                                selectedTab == i ? Color(hex: "a78bfa")
                                : (isDark ? .white.opacity(0.35) : Color(hex: "1a1a2e").opacity(0.32))
                            )
                            .scaleEffect(selectedTab == i ? 1.1 : 1.0)
                        if selectedTab == i {
                            Circle()
                                .fill(Color(hex: "a78bfa"))
                                .frame(width: 4, height: 4)
                                .matchedGeometryEffect(id: "glassyDot", in: ns)
                        } else {
                            Circle().fill(Color.clear).frame(width: 4, height: 4)
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 12)
                }
                .animation(.spring(response: 0.3, dampingFraction: 0.7), value: selectedTab)
            }
        }
        .background(
            RoundedRectangle(cornerRadius: 24)
                .fill(isDark ? AnyShapeStyle(.ultraThinMaterial) : AnyShapeStyle(Color.white.opacity(0.85)))
                .overlay(RoundedRectangle(cornerRadius: 24).stroke(Color.primary.opacity(0.08), lineWidth: 1))
        )
        .shadow(color: .black.opacity(isDark ? 0.38 : 0.1), radius: 22, y: 6)
        .padding(.horizontal, 20)
    }
}