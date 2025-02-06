//
//  ContentView.swift
//  About Me
//
//  Created by Zhanserik Amangeldi on 01.02.2025.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedTab = 0

    var body: some View {
        TabView(selection: $selectedTab) {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "person")
                }
                .tag(0)

            StoryView(selectedTab: $selectedTab)
                .tabItem {
                    Label("Story", systemImage: "book")
                }
                .tag(1)
            RandomFactsView()
                .tabItem {
                    Label("Random Facts", systemImage: "info.circle")
                }
                .tag(2)
            
        }
    }
}
#Preview {
    ContentView()
}
