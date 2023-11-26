//
//  TabView.swift
//  Showchat
//
//  Created by Vikranth Kumar on 11/26/23.
//

import SwiftUI

struct TabView: View {
    
    @State private var homeViewModel = HomeViewModel()
    
    var body: some View {
        SwiftUI.TabView {
            Group {
                HomeView(viewModel: homeViewModel)
                    .tabButton(name: .home, image: .house)
                Text(String.notifications)
                    .tabButton(name: .notifications, image: .bell)
                Text(String.settings)
                    .tabButton(name: .settings, image: .gear)
            }
            .toolbarBackground(Color.backgroundSecondary, for: .tabBar)
            .toolbarBackground(.visible, for: .tabBar)
        }
    }
}

#Preview {
    TabView()
}
