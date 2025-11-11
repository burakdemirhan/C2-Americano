//
//  HomeViews.swift
//  C2-Americano
//
//  Created by Burak Demirhan on 05/11/25.
//
import SwiftUI

struct HomeView: View {
    @StateObject private var bannerViewModel = HomeBannerViewModel()

    var body: some View {
        VStack(spacing: 30) {
            
            // ✅ Top Navigation
            HomeNavigationBar(userName: "Burak")
            
            // ✅ Category Tabs
            CategoryTabsView()
            
            ScrollView {
                VStack(spacing: 70) {
                    
                   
                    if let item = bannerViewModel.item {
                        HomeBannerView(item: item)
                    } else {
                        // Placeholder while loading
                        Rectangle()
                            .fill(Color.gray.opacity(0.3))
                            .frame(height: 420)
                            .redacted(reason: .placeholder)
                           
                    }
                    
                   
                    NetflixExclusiveRow(title: "Only on Netflix")
                    NetflixExclusiveRow(title: "Popular on Netflix")
                    NetflixExclusiveRow(title: "Trending Now")
                }
                .padding(.bottom, 40)
            }
        }
        .background(Color.netflixDark.ignoresSafeArea())
        .task {
            await bannerViewModel.load()
        }
    }
}

#Preview {
    HomeView()
}
