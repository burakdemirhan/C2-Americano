//
//  NetflixExclusiveRow.swift
//  C2-Americano
//
//  Created by Burak Demirhan on 05/11/25.
//

import Foundation
import SwiftUI

struct NetflixExclusiveRow: View {
    
    let title: String
    @StateObject private var viewModel = PosterViewModel()
    @State private var pressedPosterID: Int? = nil   // ✅ ekle
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title)
                .font(.title3.bold())
                .foregroundColor(.white)
                .padding(.horizontal)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 14) {
                    ForEach(viewModel.items) { item in
                        let isPressed = pressedPosterID == item.id
                        
                        AsyncImage(url: posterURL(for: item)) { image in
                            image
                                .resizable()
                                .scaledToFill()
                        } placeholder: {
                            ProgressView()
                        }
                        .frame(width: 120, height: 180)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .shadow(color: .black.opacity(isPressed ? 0.5 : 0.2),
                                radius: isPressed ? 14 : 6,
                                x: 0, y: isPressed ? 10 : 4)
                        .scaleEffect(isPressed ? 1.06 : 1.0)
                        .animation(.spring(response: 0.3, dampingFraction: 0.7),
                                   value: isPressed)
                        .onTapGesture {
                            withAnimation {
                                pressedPosterID =
                                isPressed ? nil : item.id
                            }
                        }
                    }
                }
                .padding(.horizontal)
            }
        }
        .task {
            await viewModel.load()
        }
    }
    
    private func posterURL(for poster: Poster) -> URL? {
        guard let path = poster.posterPath else { return nil }
        return URL(string: "https://image.tmdb.org/t/p/w500\(path)")
    }
    
    struct ScrollOffsetKey: PreferenceKey {
        static var defaultValue: CGFloat = 0
        static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
            value = nextValue()
        }
    }
}
