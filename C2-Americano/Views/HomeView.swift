



import SwiftUI

struct HomeView: View {
    @StateObject private var bannerViewModel = HomeBannerViewModel()
    @State private var hideHeader = false
    @StateObject private var viewModel = HomeViewModel()
    @State private var selectedCategory = "Series"
    
    let continueWatching = [
        ContinueWatchingItem(image: "poster1", progress: 0.4),
        ContinueWatchingItem(image: "poster2", progress: 0.8),
        ContinueWatchingItem(image: "poster3", progress: 0.2)
    ]
    
    var body: some View {
        GeometryReader { outerGeo in
            VStack(spacing: 0) {
                
                HomeNavigationBar(userName: "Burak")
                
                CategoryTabsView(selected: $selectedCategory, hideHeader: $hideHeader)
                    .zIndex(1)
                
                ScrollView {
                    VStack(spacing: 70) {
                        
                        
                        GeometryReader { geo in
                            Color.clear
                                .onChange(of: geo.frame(in: .global).minY) { newValue in
                                    withAnimation(.easeInOut(duration: 0.25)) {
                                        hideHeader = newValue < 80 // scroll aşağı
                                    }
                                }
                        }
                        .frame(height: 0)
                        
                        if let item = bannerViewModel.item {
                            HomeBannerView(item: item)
                        } else {
                            Rectangle()
                                .fill(Color.gray.opacity(0.3))
                                .frame(height: 420)
                                .redacted(reason: .placeholder)
                        }
                        
                        NetflixExclusiveRow(title: "Only on Netflix")
                        ContinueWatchingRow(items: continueWatching)
                        NetflixExclusiveRow(title: "Popular on Netflix")
                        NetflixExclusiveRow(title: "Trending Now")
                    }
                    .padding(.bottom, 40)
                }
            }
            .background(Color.netflixDark.ignoresSafeArea())
        }
        .task {
            
            await bannerViewModel.load()
            await viewModel.load(category: selectedCategory)
        }
        .onChange(of: selectedCategory) { newValue in
            
            Task {
                await viewModel.load(category: newValue)
            }
        }
    }
}

#Preview {
    HomeView()
}
