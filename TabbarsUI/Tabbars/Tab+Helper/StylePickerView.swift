//
//  StylePickerView.swift
//  TabbarsUI
//
//  Created by Dev Rana on 14/03/26.
//

import SwiftUI

// MARK: - Style Picker Sheet
struct StylePickerView: View {
    @Binding var selectedStyle: TabBarStyle
    @Binding var isShowing: Bool
    let isDark: Bool

    var body: some View {
        VStack(spacing: 0) {
            Capsule()
                .fill(Color.primary.opacity(0.2))
                .frame(width: 36, height: 4)
                .padding(.top, 12)

            Text("Choose Tab Bar Style")
                .font(.headline)
                .foregroundColor(isDark ? .white : Color(hex: "1a1a2e"))
                .padding(.vertical, 14)

            LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 10), count: 2), spacing: 10) {
                ForEach(TabBarStyle.allCases) { style in
                    Button(action: {
                        withAnimation(.spring(response: 0.4, dampingFraction: 0.7)) {
                            selectedStyle = style
                            isShowing = false
                        }
                    }) {
                        HStack(spacing: 10) {
                            Image(systemName: style.styleIcon)
                                .font(.system(size: 16, weight: .semibold))
                                .frame(width: 34, height: 34)
                                .background(
                                    RoundedRectangle(cornerRadius: 10)
                                        .fill(selectedStyle == style
                                              ? Color(hex: "7c6cf0")
                                              : Color.primary.opacity(0.1))
                                )
                                .foregroundColor(
                                    selectedStyle == style ? .white
                                    : (isDark ? .white.opacity(0.65) : Color(hex: "1a1a2e").opacity(0.65))
                                )
                            Text(style.rawValue)
                                .font(.caption.weight(.semibold))
                                .foregroundColor(
                                    selectedStyle == style
                                    ? (isDark ? .white : Color(hex: "1a1a2e"))
                                    : Color.primary.opacity(0.5)
                                )
                                .lineLimit(2)
                                .fixedSize(horizontal: false, vertical: true)
                            Spacer()
                        }
                        .padding(10)
                        .background(
                            RoundedRectangle(cornerRadius: 14)
                                .fill(selectedStyle == style
                                      ? Color(hex: "7c6cf0").opacity(isDark ? 0.2 : 0.1)
                                      : Color.primary.opacity(isDark ? 0.06 : 0.04))
                                .overlay(
                                    RoundedRectangle(cornerRadius: 14)
                                        .stroke(selectedStyle == style ? Color(hex: "7c6cf0") : Color.clear, lineWidth: 1.5)
                                )
                        )
                    }
                }
            }
            .padding(.horizontal, 14)
            .padding(.bottom, 30)
        }
        .background(
            RoundedRectangle(cornerRadius: 28)
                .fill(isDark ? AnyShapeStyle(.ultraThinMaterial) : AnyShapeStyle(Color.white.opacity(0.95)))
                .overlay(
                    RoundedRectangle(cornerRadius: 28)
                        .fill(isDark ? Color(hex: "1c1c3a").opacity(0.75) : Color.clear)
                )
        )
        .clipShape(RoundedRectangle(cornerRadius: 28))
        .padding(.horizontal, 8)
        .shadow(color: .black.opacity(isDark ? 0.4 : 0.1), radius: 24, y: -4)
    }
}
