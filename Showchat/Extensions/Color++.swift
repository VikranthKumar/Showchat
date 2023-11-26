//
//  Color++.swift
//  Showchat
//
//  Created by Vikranth Kumar on 11/25/23.
//

import SwiftUI

extension Color {
    static let background: Color = Color.black
    static let backgroundSecondary: Color = Color(hex: "#27282A")
    static let border: Color = Color(hex: "#2D2D2D")
    static let gradientStart: Color = Color(hex: "#FF8008")
    static let gradientEnd: Color = Color(hex: "#FFC837")
    static let text: Color = .white
    static let textSecondary: Color = Color(hex: "#C4C4C4").opacity(0.5)
    static let transparent: Color = Color.black.opacity(0.5)
    
}

extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
            case 3: // RGB (12-bit)
                (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
            case 6: // RGB (24-bit)
                (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
            case 8: // ARGB (32-bit)
                (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
            default:
                (a, r, g, b) = (1, 1, 1, 0)
        }
        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue:  Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}
