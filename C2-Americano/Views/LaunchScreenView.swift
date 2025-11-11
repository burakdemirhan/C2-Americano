//
//  LaunchScreenView.swift
//  C2-Americano
//
//  Created by Burak Demirhan on 11/11/25.
//

import SwiftUI

struct LaunchScreenView: View {
    @Binding var showMainView: Bool
    @State private var showLogo = false

    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()

            Image("netflixBackground")
                .resizable()
                .scaledToFit()
                .frame(width: showLogo ? 180 : 50)
                .opacity(showLogo ? 1 : 0)
                .animation(.easeOut(duration: 1.2), value: showLogo)
        }
        .task {
            // 1) Logo animasyonunu başlat
            showLogo = true

            // 2) Animasyonun görünür şekilde çalışması için bekle
            try? await Task.sleep(nanoseconds: 1_400_000_000) // ~1.4s

            // 3) Ekstra kısa bir bekleme (isteğe bağlı)
            try? await Task.sleep(nanoseconds: 400_000_000) // ~0.4s

            // 4) Artık ana görünüme geç
            withAnimation(.easeIn(duration: 0.6)) {
                showMainView = true
            }
        }
    }
}
