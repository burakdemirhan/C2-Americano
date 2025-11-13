//
//  CategoryTabsView.swift
//  C2-Americano
//
//  Created by Burak Demirhan on 06/11/25.
//

import SwiftUI

struct CategoryTabsView: View {
    @Binding var selected: String
    @Binding var hideHeader: Bool
    
    let tabs = ["Series", "Movies", "Categories"]
    
    var body: some View {
        HStack(spacing: 12) {
            ForEach(tabs, id: \.self) { tab in
                Button(action: {
                    selected = tab
                }) {
                    Text(tab)
                        .font(.caption.bold())
                        .foregroundColor(selected == tab ? .black : .white)
                        .padding(.horizontal, 16)
                        .padding(.vertical, 8)
                        .background(
                            selected == tab
                            ? Color.white
                            : Color.white.opacity(0.15)
                        )
                        .clipShape(Capsule())
                }
            }
        }
        .padding(.horizontal)
        .padding(.vertical, 6)
        .background(Color.netflixDark.opacity(0.95))
        .opacity(hideHeader ? 0 : 1)
        .offset(y: hideHeader ? -20 : 0)
        .animation(.easeInOut(duration: 0.25), value: hideHeader)
    }
}
