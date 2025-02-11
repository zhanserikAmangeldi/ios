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

//            StoryView(selectedTab: $selectedTab)
//                .tabItem {
//                    Label("Story", systemImage: "book")
//                }
//                .tag(1)
            HobbiesView()
                .tabItem {
                    Label("Hobbies", systemImage: "sun.max")
                }
            GoalsView()
                .tabItem {
                    Label("Goals", systemImage: "soccerball")
                }
//            RandomFactsView()
//                .tabItem {
//                    Label("Random Facts", systemImage: "info.circle")
//                }
//                .tag(2)
            
        }
        .accentColor(Color(red: 37/255, green: 89/255, blue: 51/255))
        .environment(\.font, .custom("LibreBaskerville-Regular", size: 16))
    }
}
#Preview {
    ContentView()
}
