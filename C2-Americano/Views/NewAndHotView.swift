//
//  NewAndHotView.swift
//  C2-Americano
//
//  Created by Burak Demirhan on 05/11/25.
//

import SwiftUI

struct NewAndHotView: View {
    
    @StateObject private var viewModel = NewAndHotViewModel()
    @State private var hideHeader = false
    
    var body: some View {
        GeometryReader { outerGeo in
            VStack(spacing: 0) {
                
                // 🔹 Üst Navigation Bar
                HomeNavigationBar(userName: "Burak")
                
                // 🔹 Series / Movies / Categories Bar
                CategoryTabsView(hideHeader: $hideHeader)
                    .zIndex(1)
                
                // 🔹 İçerik ScrollView
                ScrollView {
                    VStack(spacing: 40) {
                        
                        // 📏 Scroll konumunu ölçen görünmez katman
                        GeometryReader { geo in
                            Color.clear
                                .onChange(of: geo.frame(in: .global).minY) { newValue in
                                    withAnimation(.easeInOut(duration: 0.25)) {
                                        hideHeader = newValue < 80
                                    }
                                }
                        }
                        .frame(height: 0)
                        
                        // 🔹 Kartlar
                        ForEach(viewModel.items) { item in
                            NewAndHotCardView(item: item)
                        }
                    }
                    .padding(.bottom, 40)
                }
            }
            .background(Color.netflixDark.ignoresSafeArea())
        }
        .task {
            await viewModel.load()
        }
    }
}

#Preview {
    NewAndHotView()
}
