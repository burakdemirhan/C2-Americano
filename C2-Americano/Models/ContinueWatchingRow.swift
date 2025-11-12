//
//  ContinueWatchingRow.swift
//  C2-Americano
//
//  Created by Burak Demirhan on 12/11/25.
//
import SwiftUI

struct ContinueWatchingRow: View {
    let items: [ContinueWatchingItem]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Continue Watching for Burak")
                .font(.title3.bold())
                .foregroundColor(.white)
                .padding(.horizontal)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    ForEach(items) { item in
                        ContinueWatchingVerticalCard(item: item)
                    }
                }
                .padding(.horizontal)
            }
        }
    }
}

struct ContinueWatchingVerticalCard: View {
    let item: ContinueWatchingItem
    let cardWidth: CGFloat = 130
    
    var body: some View {
        let cardHeight = cardWidth * 1.7     // 🔸 dikey oran: yüksekliği genişliğin 1.7 katı
        let posterHeight = cardHeight * 0.8  // 🔸 %80 poster
        let bottomHeight = cardHeight * 0.2  // 🔸 %20 gri alt kısım
        
        VStack(spacing: 0) {
            
            // 🎞 Poster kısmı
            Image(item.image)
                .resizable()
                .scaledToFill()
                .frame(width: cardWidth, height: posterHeight)
                .clipped()
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.white.opacity(0.05), lineWidth: 1)
                )
            
            // 🔴 Progress bar
            ZStack(alignment: .leading) {
                Capsule()
                    .fill(Color.gray.opacity(0.4))
                    .frame(height: 3)
                Capsule()
                    .fill(Color.red)
                    .frame(width: cardWidth * item.progress, height: 3)
            }
            .padding(.horizontal, 8)
            .padding(.top, 4)
            
            
            HStack(spacing:8){
                Button(action: {}) {
                    Image(systemName: "info.circle")
                        .font(.system(size: 30))
                        .foregroundColor(.white)
                }
                
                
                
                Button(action: {}) {
                    Image(systemName: "ellipsis")
                        .rotationEffect(.degrees(90))
                        .font(.system(size: 30))
                        .foregroundColor(.white)
                }
            }
            .padding(.horizontal, 8)
            .frame(width: cardWidth, height: bottomHeight)
            .background(Color.gray.opacity(0.25))
        }
        .frame(width: cardWidth, height: cardHeight)
        .clipShape(RoundedRectangle(cornerRadius: 8))
        .shadow(color: .black.opacity(0.4), radius: 5, x: 0, y: 3)
    }
}

struct ContinueWatchingItem: Identifiable {
    let id = UUID()
    let image: String
    let progress: CGFloat // 0.0 to 1.0
}

