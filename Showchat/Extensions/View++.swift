//
//  View++.swift
//  Showchat
//
//  Created by Vikranth Kumar on 11/25/23.
//

import SwiftUI

extension View {
    func fullWidth(alignment: Alignment = .center) -> some View {
        frame(minWidth: 0, maxWidth: .infinity, alignment: alignment)
    }
    
    func fullHeight(alignment: Alignment = .center) -> some View {
        frame(minHeight: 0, maxHeight: .infinity, alignment: alignment)
    }
    
    func fullFrame() -> some View {
        frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    func tabButton(name: String, image: String) -> some View {
        tabItem {
            Label(name, systemImage: image)
        }
    }
}

extension View {
    @ViewBuilder func `if`<Content: View>(_ condition: Bool, transform: (Self) -> Content) -> some View {
        if condition {
            transform(self)
        } else {
            self
        }
    }
}
