//
//  HomeViews.swift
//  C2-Americano
//
//  Created by Burak Demirhan on 05/11/25.
//
import SwiftUI

struct HomeView: View {

    var body: some View {
        VStack(spacing: 30) {
            
            // ✅ Top Navigation
            HomeNavigationBar(userName: "Burak")
            
            // ✅ Category Tabs
            CategoryTabsView()
            
            ScrollView {
                VStack(spacing: 70) {
                    
                    // ✅ Hero Banner (Senin kartın çalışıyor)
                    HomeBannerView(
                        poster: "hounted_hotel",
                        title: "NEW SEASON",
                        description: "Yeni sezonda korku dolu anlar!"
                    )
                    
                    // ✅ Netflix Rows (API ile dinamik poster)
                    NetflixExclusiveRow(title: "Only on Netflix")
                    NetflixExclusiveRow(title: "Popular on Netflix")
                    NetflixExclusiveRow(title: "Trending Now")
                }
                .padding(.bottom, 40)
            }
        }
        .background(Color.netflixDark.ignoresSafeArea())
    }
}

#Preview {
    HomeView()
}
