//
//  HomeBannerView.swift
//  C2-Americano
//
//  Created by Burak Demirhan on 05/11/25.
//
import SwiftUI

struct HomeBannerView: View {
    let item: HotItem
    @State private var isImageLoaded = false
    @State private var isPressedPlay = false
    
    private let cardAspectRatio: CGFloat = 2.0 / 3.0
    private let cardCornerRadius: CGFloat = 16
    
    var body: some View {
        VStack(alignment: .center, spacing: 16) {
            ZStack(alignment: .bottomLeading) {
                
                // 🎬 Poster
                AsyncImage(url: item.posterURL) { image in
                    image
                        .resizable()
                        .scaledToFill()
                        .opacity(isImageLoaded ? 1 : 0)
                        .onAppear {
                            withAnimation(.easeOut(duration: 0.35)) {
                                isImageLoaded = true
                            }
                        }
                } placeholder: {
                    Rectangle()
                        .fill(Color.gray.opacity(0.25))
                        .redacted(reason: .placeholder)
                }
                .clipShape(RoundedRectangle(cornerRadius: cardCornerRadius, style: .continuous))
                
                // 🔹 Alt kısım gradient
                LinearGradient(
                    gradient: Gradient(colors: [
                        .clear,
                        .black.opacity(0.15),
                        .black.opacity(0.55),
                        .black.opacity(0.85)
                    ]),
                    startPoint: .top,
                    endPoint: .bottom
                )
                .clipShape(RoundedRectangle(cornerRadius: cardCornerRadius, style: .continuous))
                .allowsHitTesting(false)
                
                
                VStack(alignment: .leading, spacing: 10) {
                    Text(item.displayTitle)
                        .font(.system(size: 20, weight: .heavy))
                        .foregroundColor(.white)
                        .lineLimit(2)
                        .shadow(color: .black.opacity(0.6), radius: 6, x: 0, y: 3)
                    
                    if let overview = item.overview, !overview.isEmpty {
                        Text(overview)
                            .font(.footnote)
                            .foregroundColor(.white.opacity(0.9))
                            .lineLimit(2)
                            .shadow(color: .black.opacity(0.5), radius: 5, x: 0, y: 2)
                    }
                    
                    HStack(spacing: 10) {
                        Button {
                            withAnimation(.spring(response: 0.3, dampingFraction: 0.75)) {
                                isPressedPlay.toggle()
                            }
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
                                isPressedPlay = false
                            }
                        } label: {
                            HStack(spacing: 6) {
                                Image(systemName: "play.fill")
                                    .font(.subheadline.bold())
                                Text("Play")
                                    .font(.subheadline.weight(.semibold))
                            }
                            .foregroundColor(.black)
                            .padding(.horizontal, 16)
                            .padding(.vertical, 8)
                            .background(Color.white)
                            .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
                            .shadow(color: .black.opacity(0.25), radius: 8, x: 0, y: 4)
                        }
                        
                        Button {
                            // My List action
                        } label: {
                            HStack(spacing: 6) {
                                Image(systemName: "plus")
                                    .font(.subheadline.bold())
                                Text("My List")
                                    .font(.subheadline.weight(.semibold))
                            }
                            .foregroundColor(.white)
                            .padding(.horizontal, 14)
                            .padding(.vertical, 8)
                            .background(Color.white.opacity(0.14))
                            .overlay(
                                RoundedRectangle(cornerRadius: 8, style: .continuous)
                                    .stroke(Color.white.opacity(0.22), lineWidth: 1)
                            )
                            .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
                        }
                    }
                    .padding(.top, 2)
                }
                .padding(.horizontal, 14)
                .padding(.bottom, 12)
            }
            .aspectRatio(cardAspectRatio, contentMode: .fit)
            .frame(maxWidth: 340)
            .overlay(
                RoundedRectangle(cornerRadius: cardCornerRadius, style: .continuous)
                    .stroke(Color.white.opacity(0.06), lineWidth: 1)
            )
            .shadow(color: .black.opacity(0.45), radius: 20, x: 0, y: 14)
            .frame(maxWidth: .infinity, alignment: .center)
        }
        .padding(.vertical, 12)
        .frame(maxWidth: .infinity)
        .background(Color.clear)
    }
}
