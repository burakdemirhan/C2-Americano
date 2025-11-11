//
//  C2_AmericanoApp.swift
//  C2-Americano
//
//  Created by Burak Demirhan on 03/11/25.
//
import SwiftUI


@main
struct C2_AmericanoApp: App {
    
    @State private var showMainView = false
    
    init() {
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor(Color.netflixDark)
        
        appearance.stackedLayoutAppearance.normal.iconColor = .lightGray
        appearance.stackedLayoutAppearance.selected.iconColor = .white
        
        UITabBar.appearance().standardAppearance = appearance
        UITabBar.appearance().scrollEdgeAppearance = appearance
    }
    
    var body: some Scene {
        WindowGroup {
            ZStack {
                if showMainView {
                    ContentView()
                } else {
                    LaunchScreenView(showMainView: $showMainView)  
                }
            }
        }
    }
}
