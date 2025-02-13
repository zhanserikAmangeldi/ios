//
//  ContentView.swift
//  About Me
//
//  Created by Zhanserik Amangeldi on 01.02.2025.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedTab = 0

    // https://www.hackingwithswift.com/forums/swiftui/custom-font-in-navigation-title-and-back-button/22989
    init() {
        let fontTab = [NSAttributedString.Key.font: UIFont(name: "AtkinsonHyperlegibleNext-SemiBold", size: 10)!]

        UITabBarItem.appearance().setTitleTextAttributes(fontTab, for: .normal)


        let fontNav: [NSAttributedString.Key: Any] = [
            .font: UIFont(name: "AtkinsonHyperlegibleNext-SemiBold", size: 17)!,
        ]
        UINavigationBar.appearance().titleTextAttributes = fontNav
        UIBarButtonItem.appearance().setTitleTextAttributes(fontNav, for: .normal)
     }

    var body: some View {
        TabView(selection: $selectedTab) {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "person")
                }
                .tag(0)
            HobbiesView(selectedTab: $selectedTab)
                .tabItem {
                    Label("Hobbies", systemImage: "sun.max")
                }
                .tag(1)
            GoalsView()
                .tabItem {
                    Label("Goals", systemImage: "soccerball")
                }

        }
        .accentColor(.PrimaryColor)
        .environment(\.font, .customBody)
    }
}
#Preview {
    ContentView()
}
