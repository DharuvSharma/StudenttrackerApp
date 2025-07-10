//
//  MainTabView.swift
//  StudentTrackerApp
//
//  Created by Dharuv Sharma on 09/07/25.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            DashboardView()
                .tabItem {
                    Label("Dashboard", systemImage: "rectangle.grid.1x2") // Use SF Symbol for clarity
                }
            ProfileView()
                .tabItem {
                    Label("Settings", systemImage: "gearshape")
                }
        }
        .tint(.purple) // Set tint color for selected tab item
    }
}
