//
//  ContentView.swift
//  StudentTrackerApp
//
//  Created by Dharuv Sharma on 09/07/25.
//


import SwiftUI

struct ContentView: View {
    @AppStorage("isLoggedIn") private var isLoggedIn = false // Persistent login state

    var body: some View {
        // Conditionally show MainTabView or LoginView with transition animation
        if isLoggedIn {
            MainTabView()
                .transition(.opacity.combined(with: .scale))
        } else {
            LoginView()
                .transition(.opacity.combined(with: .scale))
        }
    }
}
