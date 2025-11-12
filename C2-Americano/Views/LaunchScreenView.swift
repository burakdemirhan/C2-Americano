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
           
            showLogo = true

           
            try? await Task.sleep(nanoseconds: 1_400_000_000) // ~1.4s

            
            try? await Task.sleep(nanoseconds: 400_000_000) // ~0.4s

           
            withAnimation(.easeIn(duration: 0.6)) {
                showMainView = true
            }
        }
    }
}
