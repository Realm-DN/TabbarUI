//
//  TabbarContent.swift
//  TabbarsUI
//
//  Created by Dev Rana on 14/03/26.
//

import Foundation

// MARK: - Tab Item Model
struct TabItem {
    let icon: String
    let label: String
}

let tabs: [TabItem] = [
    TabItem(icon: "house.fill",        label: "Home"),
    TabItem(icon: "magnifyingglass",   label: "Search"),
    TabItem(icon: "plus.circle.fill",  label: "Create"),
    TabItem(icon: "heart.fill",        label: "Likes"),
    TabItem(icon: "person.fill",       label: "Profile"),
]

// MARK: - Tab Bar Styles
enum TabBarStyle: String, CaseIterable, Identifiable {
    case floating   = "Floating Pill"
    case glassy     = "Glassy Blur"
    case neon       = "Neon Glow"
    case minimal    = "Minimal Line"
    case bouncy     = "Bouncy Icons"
    case notched    = "Notched Fab"
    case gradient   = "Gradient Wave"
    case neumorphic = "Neumorphic"

    var id: String { rawValue }

    var styleIcon: String {
        switch self {
        case .floating:   return "capsule.fill"
        case .glassy:     return "sparkles"
        case .neon:       return "bolt.fill"
        case .minimal:    return "line.horizontal.3"
        case .bouncy:     return "arrow.up.and.down.circle.fill"
        case .notched:    return "circle.fill"
        case .gradient:   return "waveform"
        case .neumorphic: return "circle.hexagongrid.fill"
        }
    }
}
